defmodule Sapients.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :hidden, :boolean, default: false, null: false
      add :order, :integer, default: 1, null: false
      add :credo, :text
    end
  end
end
