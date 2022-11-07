defmodule SapientsWeb.PanoramaLive.Show do
  use SapientsWeb, :live_view

  alias Sapients.Media

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:panorama, Media.get_panorama!(id))}
  end

  defp page_title(:show), do: "Show Panorama"
  defp page_title(:edit), do: "Edit Panorama"
end
