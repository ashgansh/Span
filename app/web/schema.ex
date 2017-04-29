defmodule App.Schema do
  use Absinthe.Schema
  import_types App.Schema.Types

  query do
    field :assets, list_of(:asset) do
      resolve &App.AssetResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &App.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &App.UserResolver.find/2
    end
  end
  mutation do
    field :create_asset, type: :asset do
      arg :name, non_null(:string)
      arg :location, non_null(:string)

      resolve &App.AssetResolver.create/2
    end
  end
end
