defmodule SapientsWeb.NostrController do
  use SapientsWeb, :controller

  def index(conn, _params) do
    conn
    |> put_secure_browser_headers(%{"Access-Control-Allow-Origin" => "*"})
    |> render("index.json")
  end
end
