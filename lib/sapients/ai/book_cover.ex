defmodule Sapients.AI.BookCover do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_covers" do
    field :author, :string
    field :description, :string
    field :img_urls, {:array, :string}
    field :source_url, :string
    field :tags, {:array, :string}
    field :title, :string

    belongs_to :user, Sapients.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(book_cover, attrs) do
    book_cover
    |> cast(attrs, [:img_urls, :source_url, :title, :author, :description, :tags])
    |> validate_required([:title])
  end
end
