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
    field :location, :id
    field :timestamps, :string
  end

  object :location do
    field :id, :id
    field :name, :string
    field :longitude, :float
    field :latitude, :float
  end
end
