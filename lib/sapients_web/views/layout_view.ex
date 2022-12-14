defmodule SapientsWeb.LayoutView do
  use SapientsWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def active_path(conn) do
    Path.join(["/" | conn.path_info])
  end

  def active_class(conn, path) do
    current_path = Path.join(["/" | conn.path_info])
    if path == current_path do
      "text-#{conn.assigns.palette}-accent transition"
    else
      "hover:text-#{conn.assigns.palette}-accent transition"
    end
  end

  def list_links() do
    Application.get_env(:sapients, :social_links)
  end

  def copyright() do
    "© #{year()} Sapients Art"
  end

  def year() do
    DateTime.utc_now |> Map.fetch!(:year)
  end
end
