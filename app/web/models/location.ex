defmodule App.Location do
  use App.Web, :model
  alias App.Asset

  schema "locations" do
    field :name, :string
    field :latitude, :float
    field :longitude, :float
    has_many :assets, Asset
    belongs_to :user, App.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}, user_id) do
    location_struct = Map.put(struct, :user_id, user_id)
    location_struct
    |> cast(params, [:name, :latitude, :longitude, :user_id])
    |> validate_required([:name, :latitude, :longitude, :user_id])
  end
end
