defmodule Sapients.Repo.Migrations.SdAddUsersRef do
  use Ecto.Migration

  def change do
    alter table(:book_covers) do
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
