defmodule Sapients.Repo.Migrations.LinksAddPersonalWebsite do
  use Ecto.Migration

  def change do
    alter table(:links) do
      add :personal_website, :string
    end
  end
end
