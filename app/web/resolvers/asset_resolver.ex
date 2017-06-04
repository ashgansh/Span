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

  def create(args, _info) do
    %Asset{}
    |> Asset.changeset(args)
    |> Repo.insert
  end

  def delete(%{id: id}, _info) do
    asset = Repo.get!(Asset, id)
    Repo.delete(asset)
  end

  def update(%{id: id, asset: asset_params}, _info) do
    Repo.get!(Asset, id)
    |> Asset.changeset(asset_params)
    |> Repo.update
  end
end
