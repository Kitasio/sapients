defmodule Sapients.Repo.Migrations.AddPostSize do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :size, :integer, null: false, default: 1
    end
  end
end
