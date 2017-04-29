defmodule App.Repo.Migrations.CreateAsset do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :name, :string
      add :location, :string

      timestamps()
    end

  end
end
