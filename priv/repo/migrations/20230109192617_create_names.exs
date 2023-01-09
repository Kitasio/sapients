defmodule Sapients.Repo.Migrations.CreateNames do
  use Ecto.Migration

  def change do
    drop_if_exists table(:names)

    create table(:names) do
      add :name, :string
      add :pubkey, :string

      timestamps()
    end
  end
end
