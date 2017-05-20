defmodule App.AssetResolver do
  alias App.Repo
  alias App.Asset

  def all(_args, _info) do
    {:ok, Repo.all(Asset)}
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
end
