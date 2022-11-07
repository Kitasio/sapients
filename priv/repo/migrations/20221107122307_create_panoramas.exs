defmodule Sapients.Repo.Migrations.CreatePanoramas do
  use Ecto.Migration

  def change do
    create table(:panoramas) do
      add :url, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:panoramas, [:user_id])
  end
end
