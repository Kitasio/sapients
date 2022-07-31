defmodule Sapients.Media.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :icon, :string
    field :title, :string
    field :url, :string
    field :personal_website, :boolean

    belongs_to :user, Sapients.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:title, :icon, :url, :personal_website])
    |> validate_required([:url])
  end
end
