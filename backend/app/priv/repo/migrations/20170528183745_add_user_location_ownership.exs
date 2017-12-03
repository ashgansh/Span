defmodule App.Repo.Migrations.AddUserLocationOwnership do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      add :user_id, references(:users), null: false
    end
  end
end
