defmodule Sapients.Repo.Migrations.LinksFixWebsiteDefaultFalse do
  use Ecto.Migration

  def change do
    alter table(:links) do
      remove :personal_website
    end

    alter table(:links) do
      add :personal_website, :boolean, default: false, null: false
    end
  end
end
