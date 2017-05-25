defmodule App.LocationResolver do
  alias App.Repo
  alias App.Location

  def all(_args, _info) do
    {:ok, Repo.all(Location)}
  end

  def create(args, _info) do
    %Location{}
    |> Location.changeset(args)
    |> Repo.insert
  end

  #  def delete(%{id: id}, _info) do
  #    asset = Repo.get!(Asset, id)
  #    Repo.delete(asset)
  #  end
end
