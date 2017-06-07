defmodule App.LocationResolverTest do
  alias App.User
  alias App.Location
  use App.ModelCase

  @location %{name: "The office", latitude: 1.003, longitude: 1.001}

  setup do
    {:ok, user} = %User{name: "Benjamin", email: "ben@ben.com"}
                  |> User.registration_changeset(%{password: "password"})
                  |> Repo.insert()
    Faker.start


    for _ <- 1..10 do
      Repo.insert!(%Location{
        name: Faker.Commerce.En.department,
        latitude: 49.6116,
        longitude: 6.1319,
        user_id: user.id,
      })
    end

    %{user: user}
  end

  test "all locations", %{user: user} do

    {:ok, location_list} = App.LocationResolver.all('', %{context: %{current_user: %{id: user.id}}})
    assert length(location_list) == 10
  end

  test "all location from another user" do
    {:ok, user} = %User{name: "other user", email: "ben2@ben2.com"}
                  |> User.registration_changeset(%{password: "password"})
                  |> Repo.insert()

    {:ok, location_list} = App.LocationResolver.all('', %{context: %{current_user: %{id: user.id}}})
    assert length(location_list) == 0
  end

  test "all location without a valid user object" do
    {:error, error} = App.LocationResolver.all('', '')
    assert error == "Not authorized"
  end

  test "create with valid user in context", %{user: user}do
    {:ok, location} = App.LocationResolver.create(@location, %{context: %{current_user: %{id: user.id}}})
    assert location.name == @location.name
  end
end
