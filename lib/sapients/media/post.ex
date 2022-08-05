defmodule Sapients.Media.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :image, :string
    field :order, :integer
    field :title, :string
    field :url, :string
    field :size, :integer

    belongs_to :user, Sapients.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :image, :url, :order, :size])
    |> validate_required([:title, :description, :image, :url, :order])
    |> validate_number(:size, greater_than_or_equal_to: 1, less_than_or_equal_to: 3)
    |> validate_length(:title, min: 3, max: 100)
    |> validate_length(:url, max: 2047)
    |> validate_length(:image, max: 2047)
    |> validate_length(:description, max: 2047)
  end
end
