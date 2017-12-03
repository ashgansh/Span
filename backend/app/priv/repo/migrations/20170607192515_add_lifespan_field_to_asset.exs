defmodule App.Repo.Migrations.AddLifespanFieldToAsset do
  use Ecto.Migration

  def change do
    alter table(:assets) do
      add :lifespan, :integer
      add :expires_at, :utc_datetime
    end
  end
end
