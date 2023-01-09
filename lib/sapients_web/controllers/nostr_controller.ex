defmodule SapientsWeb.NostrController do
  use SapientsWeb, :controller
  alias Sapients.Nostr

  def index(conn, %{"name" => name}) do
    nip05 = Nostr.get_nip05_by_name!(name)

    conn
    |> put_secure_browser_headers(%{"Access-Control-Allow-Origin" => "*"})
    |> render("index.json", nip05: nip05)
  end
end
