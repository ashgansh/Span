defmodule App.AssetResolver do
  alias App.Repo
  alias App.Asset
  import Ecto.Query, only: [where: 2]

  def all(_args, %{context: %{current_user: %{id: id}}}) do
    assets =
      Asset
      |> where(user_id: ^id)
      |> Repo.all

    {:ok, assets}
  end

  def all(_args, _info) do
    {:error, "Not authorized"}
  end

  def create(args, %{context: %{current_user: %{id: id}}}) do
    %Asset{}
    |> Asset.changeset(args, id)
    |> Repo.insert
  end

  def delete(%{id: id}, _info) do
    asset = Repo.get!(Asset, id)
    Repo.delete(asset)
  end

  def update(%{id: id, asset: asset_params}, %{context: %{current_user: %{id: user_id}}}) do
    Asset
    |> where(user_id: ^user_id)
    |> Repo.get(id)
    |> Asset.changeset(asset_params, user_id)
    |> Repo.update
  end
end
