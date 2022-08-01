defmodule SapientsWeb.LayoutView do
  use SapientsWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def copyright() do
    "© #{year()} Sapients Art"
  end

  def year() do
    DateTime.utc_now |> Map.fetch!(:year)
  end
end
