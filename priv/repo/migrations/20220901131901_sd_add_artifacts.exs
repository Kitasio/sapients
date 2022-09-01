defmodule Sapients.Repo.Migrations.SdAddArtifacts do
  use Ecto.Migration

  def change do
    alter table(:book_covers) do
      add :sd_artefacts, {:array, :string}, default: []
    end
  end
end
