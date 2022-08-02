defmodule SapientsWeb.ImageLive.Index do
  use SapientsWeb, :live_view

  alias Sapients.Media
  alias Sapients.Media.Image
  alias Sapients.Accounts

  @impl true
  def mount(_params, session, socket) do
    socket =
      socket
      |> assign(:images, list_images())
      |> assign(:user, Accounts.get_user_by_session_token(session["user_token"]))

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Image")
    |> assign(:image, Media.get_image!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Drop image or click here")
    |> assign(:user, socket.assigns.user)
    |> assign(:image, %Image{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Images")
    |> assign(:image, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    image = Media.get_image!(id)
    {:ok, _} = Media.delete_image(image)

    {:noreply, assign(socket, :images, list_images())}
  end

  defp list_images do
    Media.list_images()
  end
end
