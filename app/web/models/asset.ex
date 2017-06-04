defmodule App.Asset do
  use App.Web, :model

  schema "assets" do
    field :name, :string
    belongs_to :location, App.Location

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location_id])
    |> validate_required([:name, :location_id])
  end
end
