defmodule Sapients.Media.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :image, :string
    field :order, :integer
    field :title, :string
    field :url, :string

    belongs_to :user, Sapients.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :image, :url, :order])
    |> validate_required([:title, :description, :image, :url, :order])
  end
end
