defmodule Sapients.Repo.Migrations.LinksChangeWebsiteToBoolean do
  use Ecto.Migration

  def change do
    alter table(:links) do
      remove :personal_website
    end

    alter table(:links) do
      add :personal_website, :boolean
    end
  end
end
