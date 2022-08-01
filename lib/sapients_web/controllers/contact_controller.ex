defmodule SapientsWeb.ContactController do
  use SapientsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
