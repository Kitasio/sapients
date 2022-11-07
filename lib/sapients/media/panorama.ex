defmodule Sapients.Media.Panorama do
  use Ecto.Schema
  import Ecto.Changeset

  schema "panoramas" do
    field :url, :string

    belongs_to :user, Sapients.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(panorama, attrs) do
    panorama
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
