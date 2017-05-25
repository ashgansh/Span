defmodule App.Location do
  use App.Web, :model
  alias App.Asset

  schema "locations" do
    field :name, :string
    field :latitude, :float
    field :longitude, :float
    has_many :assets, App.Asset

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :latitude, :longitude])
    |> validate_required([:name, :latitude, :longitude])
  end
end
