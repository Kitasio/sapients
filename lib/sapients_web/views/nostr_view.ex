defmodule SapientsWeb.NostrView do
  use SapientsWeb, :view

  alias Sapients.Nostr

  def render("index.json", params) do
    %Nostr.NIP05{name: name, pubkey: pubkey} = params.nip05

    names = %{
      name => pubkey |> npub_to_hex()
    }

    %{
      names: names
    }
  end

  def npub_to_hex("npub" <> _ = pk) do
    case Bech32.decode(pk) do
      {:ok, "npub", pubkey} ->
        pubkey |> Base.encode16(case: :lower)

      {:error, msg} ->
        raise msg
    end
  end
end
