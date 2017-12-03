defmodule App.UserResolver do
  alias App.Repo
  alias App.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(User, id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(%{ user: user_params }, _info) do
    %User{}
    |> User.registration_changeset(user_params)
    |> Repo.insert

  end

  def update(%{id: id, user: user_params}, _info) do
    Repo.get!(User, id)
    |> User.update_changeset(user_params)
    |> Repo.update
  end

  def login(params, _info) do
    with {:ok, user} <- App.Session.authenticate(params, Repo),
         {:ok, jwt, _} <- Guardian.encode_and_sign(user, :access) do
       {:ok, %{token: jwt}}
     end
  end
end
