defmodule App.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

  end
end
