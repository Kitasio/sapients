defmodule Sapients.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :icon, :string
      add :url, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:links, [:user_id])
  end
end
