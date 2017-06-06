defmodule App.UserTest do
  use App.ModelCase

  alias App.User

  @valid_attrs %{email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "registration_changeset with valid attributes" do
    changeset = User.registration_changeset(%User{}, Map.put(@valid_attrs, :password, "password"))
    assert changeset.valid?
  end

  test "put_pass_hash" do
    changeset = %User{}
                |> cast(%{ password: "password" }, [:password])
                |> validate_required([:password])

    password_changeset = User.put_pass_hash(changeset)
    assert String.length(password_changeset.changes.password_hash) > 0
  end
end
