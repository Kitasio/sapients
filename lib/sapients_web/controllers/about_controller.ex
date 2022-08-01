defmodule SapientsWeb.AboutController do
  use SapientsWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
