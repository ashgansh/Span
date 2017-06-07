defmodule App.Repo.Migrations.AddLifespanFieldToAsset do
  use Ecto.Migration

  def change do
    alter table(:assets) do
      add :lifespan, :integer
    end
  end
end
