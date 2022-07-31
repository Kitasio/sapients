defmodule SapientsWeb.AdminController do
  use SapientsWeb, :controller

  def index(conn, _) do
    conn
    |> render("index.html")
  end
end
