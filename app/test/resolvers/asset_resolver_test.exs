defmodule App.AssetResolverTest do
  alias App.User
  alias App.Asset
  alias App.Location
  use App.ModelCase

  @asset %{name: "Bike", lifespan: 1}
  @location %Location{name: "The office", latitude: 1.003, longitude: 1.001}
  @user %User{name: "Benjamin", email: "ben@ben.com"}

  setup do
    {:ok, user} = @user
                  |> User.registration_changeset(%{password: "password"})
                  |> Repo.insert()

    {:ok, location} =  Map.put(@location, :user_id, user.id)
                  |> Repo.insert()
    Faker.start


    for _ <- 1..10 do
      Repo.insert!(%Asset{
        name: Faker.Commerce.En.department,
        lifespan: 49,
        location_id: location.id,
        user_id: user.id,
      })
    end

    %{user: user}
  end

  test "all assets", %{user: user} do

    {:ok, asset_list} = App.AssetResolver.all('', %{context: %{current_user: %{id: user.id}}})
    assert length(asset_list) == 10
  end

  test "all assets from another user" do
    {:ok, user} = @user
                  |> Repo.insert()

    {:ok, asset_list} = App.AssetResolver.all('', %{context: %{current_user: %{id: user.id}}})
    assert length(asset_list) == 0
  end

  test "all asset without a valid user object" do
    {:error, error} = App.AssetResolver.all('', '')
    assert error == "Not authorized"
  end

  test "create with valid user in context", %{user: user}do
    {:ok, location} =  Map.put(@location, :user_id, user.id)
                       |> Repo.insert()


    new_asset = Map.put(@asset, :location_id, location.id)
    {:ok, asset} = App.AssetResolver.create(new_asset, %{context: %{current_user: %{id: user.id}}})
    assert asset.name == @asset.name
  end

end
