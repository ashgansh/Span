defmodule App.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: App.Repo

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :asset do
    field :id, :id
    field :name, :string
    field :location, :location, resolve: assoc(:location)
    field :lifespan, :integer
    field :inserted_at, :string
    field :expires_at, :string
  end

  object :location do
    field :id, :id
    field :name, :string
    field :longitude, :float
    field :latitude, :float
    field :assets, list_of(:asset), resolve: assoc(:assets)
  end

  object :session do
    field :token, :string
  end
end
