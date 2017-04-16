defmodule App.UserResolver do
  alias App.Repo
  alias App.User

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def create(args, _info) do
    %User{}
    |> User.changeset(args)
    |> Repo.insert
  end
end
