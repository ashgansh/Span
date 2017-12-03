defmodule App.Repo.Migrations.AssetLocationRelation do
  use Ecto.Migration

  def change do
    alter table(:assets) do
      add :location_id, references(:locations), null: false
    end
  end
end
