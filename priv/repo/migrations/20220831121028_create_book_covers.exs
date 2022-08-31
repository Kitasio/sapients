defmodule Sapients.Repo.Migrations.CreateBookCovers do
  use Ecto.Migration

  def change do
    create table(:book_covers) do
      add :img_urls, {:array, :string}
      add :source_url, :string
      add :title, :string
      add :author, :string
      add :description, :text
      add :tags, {:array, :string}

      timestamps()
    end
  end
end
