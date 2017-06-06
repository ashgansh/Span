defmodule App.AssetTest do
  use App.ModelCase

  alias App.Asset

  @valid_attrs %{location_id: 1, name: "some content"}
  @user_id 1
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Asset.changeset(%Asset{}, @valid_attrs, @user_id)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Asset.changeset(%Asset{}, @invalid_attrs)
    refute changeset.valid?
  end
end
