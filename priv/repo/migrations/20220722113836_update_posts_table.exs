defmodule Sapients.Repo.Migrations.UpdatePostsTable do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :user_id, :id
    end
  end
end
