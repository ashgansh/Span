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

    field :locations, type: list_of(:location) do
      resolve &App.LocationResolver.all/2
    end
  end
  mutation do
    field :create_asset, type: :asset do
      arg :name, non_null(:string)
      arg :location, non_null(:id)

      resolve &App.AssetResolver.create/2
    end


    field :delete_asset, type: :asset do
      arg :id, non_null(:integer)

      resolve &App.AssetResolver.delete/2
    end

    field :create_location, type: :location do
      arg :name, non_null(:string)
      arg :latitude, non_null(:float)
      arg :longitude, non_null(:float)

      resolve &App.LocationResolver.create/2
    end
  end
end
