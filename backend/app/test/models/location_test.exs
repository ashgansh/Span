defmodule App.LocationTest do
  use App.ModelCase

  alias App.Location

  @valid_attrs %{latitude: "120.5", longitude: "120.5", name: "some content"}
  @user_id 1
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs, @user_id)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
