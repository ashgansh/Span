defmodule App.Repo.Migrations.AddUserRelationToAssets do
  use Ecto.Migration

  def change do
    alter table(:assets) do
      add :user_id, references(:users), null: false
    end
  end
end
