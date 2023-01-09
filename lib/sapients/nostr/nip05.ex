defmodule Sapients.Nostr.NIP05 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "names" do
    field :name, :string
    field :pubkey, :string

    timestamps()
  end

  @doc false
  def changeset(nip05, attrs) do
    nip05
    |> cast(attrs, [:name, :pubkey])
    |> validate_required([:name, :pubkey])
  end
end
