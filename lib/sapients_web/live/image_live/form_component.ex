defmodule SapientsWeb.ImageLive.FormComponent do
  use SapientsWeb, :live_component

  alias Sapients.Media

  @impl true
  def update(%{image: image, user: user} = assigns, socket) do
    changeset = Media.change_image(image)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:user, user)
     |> allow_upload(:image,
       accept: ~w(.jpg .jpeg .png .zip),
       max_entries: 5,
       max_file_size: 100_000_000
     )}
  end

  @impl true
  def handle_event("validate", %{"image" => image_params}, socket) do
    changeset =
      socket.assigns.image
      |> Media.change_image(image_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"image" => image_params}, socket) do
    uploaded_files = consume_images(socket)

    for url <- uploaded_files do
      image_params = %{image_params | "image_url" => url}
      save_image(socket, socket.assigns.action, image_params)
    end

    {:noreply,
     socket
     |> push_redirect(to: socket.assigns.return_to)}
  end

  def handle_event("cancel_upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :image, ref)}
  end

  defp consume_images(socket) do
    imagekit_url = Application.get_env(:sapients, :imagekit_url)
    bucket = Application.get_env(:sapients, :bucket)

    consume_uploaded_entries(socket, :image, fn meta, entry ->
      if ext(entry) == "zip" do
        unzip_file(meta.path)
      else
        filename = "#{entry.uuid}.#{ext(entry)}"
        file = File.read!(meta.path)

        ExAws.S3.put_object(bucket, filename, file)
        |> ExAws.request!()

        image_url = Path.join(imagekit_url, filename)
        {:ok, image_url}
      end
    end)
  end

  def unzip_file(file) do
    base_path =
      if System.get_env("MIX_ENV") == "prod" do
        [Application.app_dir(:sapients), "priv/static/panorama"] |> Path.join()
      else
        "priv/static/panorama"
      end

    zip_file = Unzip.LocalFile.open(file)
    {:ok, unzip} = Unzip.new(zip_file)

    file_entries = Unzip.list_entries(unzip)

    for file_entry <- file_entries do
      %Unzip.Entry{file_name: file_name} = file_entry
      out_file_name = Path.join(base_path, file_name)
      dir = Path.dirname(out_file_name)

      if File.exists?(dir) do
        if Path.extname(out_file_name) != "" do
          Unzip.file_stream!(unzip, file_name)
          |> Stream.into(File.stream!(out_file_name))
          |> Stream.run()
        end
      else
        File.mkdir_p!(dir)
      end
    end
  end

  def ext(entry) do
    [ext | _] = MIME.extensions(entry.client_type)
    ext
  end

  defp save_image(socket, :edit, image_params) do
    case Media.update_image(socket.assigns.image, image_params) do
      {:ok, _image} ->
        {:noreply,
         socket
         |> put_flash(:info, "Image updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_image(socket, :new, image_params) do
    case Media.create_image(socket.assigns.user, image_params) do
      {:ok, _image} ->
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  defp error_to_string(error), do: error
end
