defmodule Sapients.Repo.Migrations.ModifyBookCovers do
  use Ecto.Migration

  def change do
    alter table(:book_covers) do
      modify :img_urls, {:array, :string}, default: []
    end
  end
end
