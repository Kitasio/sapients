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
     |> allow_upload(:image, accept: ~w(.jpg .jpeg .png))}
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
    uploaded_files =
      consume_uploaded_entries(socket, :image, fn %{path: path}, entry ->
        dest = Path.join("priv/static/uploads", "#{entry.uuid}.#{ext(entry)}")
        File.cp!(path, dest)
        {:ok, Routes.static_path(socket, "/uploads/#{entry.uuid}.#{ext(entry)}")}
      end)

    [file | _] = uploaded_files
    image_params = %{image_params | "image_url" => file}

    save_image(socket, socket.assigns.action, image_params)
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
        {:noreply,
         socket
         |> put_flash(:info, "Image created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
