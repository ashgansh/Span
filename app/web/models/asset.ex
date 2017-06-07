defmodule App.Asset do
  use App.Web, :model

  schema "assets" do
    field :name, :string
    field :lifespan, :integer
    belongs_to :location, App.Location
    belongs_to :user, App.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}, user_id) do
    asset_struct = Map.put(struct, :user_id, user_id)
    asset_struct
    |> cast(params, [:name, :location_id, :user_id, :lifespan])
    |> validate_required([:name, :location_id, :user_id])
  end
end
