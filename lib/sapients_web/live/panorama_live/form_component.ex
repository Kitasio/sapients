defmodule SapientsWeb.PanoramaLive.FormComponent do
  use SapientsWeb, :live_component

  alias Sapients.Media

  @impl true
  def update(%{panorama: panorama, user: user} = assigns, socket) do
    changeset = Media.change_panorama(panorama)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:user, user)
     |> allow_upload(:image,
       accept: ~w(.zip),
       max_entries: 5,
       max_file_size: 100_000_000
     )}
  end

  @impl true
  def handle_event("validate", %{"panorama" => panorama_params}, socket) do
    changeset =
      socket.assigns.panorama
      |> Media.change_panorama(panorama_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"panorama" => panorama_params}, socket) do
    uploaded_files = consume_files(socket)

    IO.inspect(uploaded_files, label: "UPLOADED FILES")

    for url <- uploaded_files do
      IO.inspect(panorama_params, label: "PARAMS")
      panorama_params = %{panorama_params | "url" => url}
      save_panorama(socket, socket.assigns.action, panorama_params)
    end

    {:noreply,
     socket
     |> push_redirect(to: socket.assigns.return_to)}
  end

  defp save_panorama(socket, :edit, panorama_params) do
    case Media.update_panorama(socket.assigns.panorama, panorama_params) do
      {:ok, _panorama} ->
        {:noreply,
         socket
         |> put_flash(:info, "Panorama updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_panorama(socket, :new, panorama_params) do
    case Media.create_panorama(socket.assigns.user, panorama_params) do
      {:ok, _panorama} ->
        {:noreply,
         socket
         |> put_flash(:info, "Panorama created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp consume_files(socket) do
    consume_uploaded_entries(socket, :image, fn meta, entry ->
      unzip_file(meta.path)

      base_path =
        if System.get_env("MIX_ENV") == "prod" do
          "https://sapients.art/panorama"
        else
          "http://localhost:4000/panorama"
        end

      filename =
        [base_path, entry.client_name |> String.split(".") |> List.first(), "index.html"]
        |> Path.join()

      {:ok, filename}
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

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  defp error_to_string(error), do: error
end
