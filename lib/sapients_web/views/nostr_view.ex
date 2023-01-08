defmodule SapientsWeb.NostrView do
  use SapientsWeb, :view

  def render("index.json", %{}) do
    names = %{
      langur: "npub1k0x9g3pavpte9ht3mcatedcgyv5005v8mpwwaam7q37a0m3zmguqsxlukk" |> npub_to_hex()
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
