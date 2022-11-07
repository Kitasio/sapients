defmodule SapientsWeb.PanoramaLive.Index do
  use SapientsWeb, :live_view

  alias Sapients.Media
  alias Sapients.Media.Panorama
  alias Sapients.Accounts

  @impl true
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])

    socket =
      socket
      |> assign(:panoramas, list_user_panoramas(user))
      |> assign(:user, user)

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Panorama")
    |> assign(:panorama, Media.get_panorama!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Panorama")
    |> assign(:panorama, %Panorama{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Panoramas")
    |> assign(:panorama, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    panorama = Media.get_panorama!(id)
    {:ok, _} = Media.delete_panorama(panorama)

    {:noreply, assign(socket, :panoramas, list_user_panoramas(socket.assigns.user))}
  end

  defp list_user_panoramas(user) do
    Media.list_user_panoramas(user)
  end
end
