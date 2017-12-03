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

  input_object :update_asset_params do
    field :name, :string
    field :location_id, :integer
    field :lifespan, :integer
  end

  input_object :update_location_params do
    field :name, :string
    field :longitude, :float
    field :latitude, :float
  end

  input_object :update_user_params do
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :password, non_null(:string)
  end

  mutation do
    field :create_user, type: :user do
      arg :user, :update_user_params 
      resolve &App.UserResolver.create/2
    end


    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &App.UserResolver.login/2
    end

    field :create_asset, type: :asset do
      arg :name, non_null(:string)
      arg :location_id, non_null(:integer)
      arg :lifespan, :integer

      resolve &App.AssetResolver.create/2
    end

    field :delete_asset, type: :asset do
      arg :id, non_null(:integer)

      resolve &App.AssetResolver.delete/2
    end

    field :update_asset, type: :asset do
      arg :id, non_null(:integer)
      arg :asset, :update_asset_params

      resolve &App.AssetResolver.update/2
    end

    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &App.UserResolver.update/2
    end

    # Locations
    field :create_location, type: :location do
      arg :name, non_null(:string)
      arg :latitude, non_null(:float)
      arg :longitude, non_null(:float)

      resolve &App.LocationResolver.create/2
    end

    field :update_location, type: :location do
      arg :id, non_null(:integer)
      arg :location, :update_location_params

      resolve &App.LocationResolver.update/2
    end

    field :delete_location, type: :location do
      arg :id, non_null(:integer)

      resolve &App.LocationResolver.delete/2
    end
  end
end
