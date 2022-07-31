defmodule Sapients.Repo.Migrations.UpdatePostsAddRefToUser do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :user_id
    end

    alter table(:posts) do
      add :user_id, references(:users)
    end
  end
end
