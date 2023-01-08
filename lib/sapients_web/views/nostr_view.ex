defmodule SapientsWeb.NostrView do
  use SapientsWeb, :view

  def render("index.json", %{}) do
    %{
      names: %{
        langur: "npub1k0x9g3pavpte9ht3mcatedcgyv5005v8mpwwaam7q37a0m3zmguqsxlukk"
      }
    }
  end
end
