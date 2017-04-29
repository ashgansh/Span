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
    field :location, :string
    field :timestamps, :string
  end
end
