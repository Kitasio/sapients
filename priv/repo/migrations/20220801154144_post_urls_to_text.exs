defmodule Sapients.Repo.Migrations.PostUrlsToText do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :url
      remove :image
      remove :description
    end 

    alter table(:posts) do
      add :url, :text
      add :image, :text
      add :description, :text
    end
  end
end
