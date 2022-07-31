defmodule Sapients.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :string
      add :image, :string
      add :url, :string
      add :order, :integer

      timestamps()
    end
  end
end
