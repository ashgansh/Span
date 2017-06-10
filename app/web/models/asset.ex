defmodule App.Asset do
  use App.Web, :model

  schema "assets" do
    field :name, :string
    field :lifespan, :integer
    field :expires_at, :utc_datetime
    belongs_to :location, App.Location
    belongs_to :user, App.User

    timestamps()
  end

  def set_expiration(changes) do
    case (changes) do
      %Ecto.Changeset{valid?: true, changes: %{ lifespan: lifespan }} ->
        {:ok, expires_at } = NaiveDateTime.utc_now()
                             |> NaiveDateTime.add(lifespan, :second)
                             |> DateTime.from_naive("Etc/UTC")

       changes
       |> put_change(:expires_at, expires_at)
      %Ecto.Changeset{valid?: true, data: %App.Asset{ inserted_at: inserted_at }, changes: %{ lifespan: lifespan }} ->

        {:ok, expires_at } = inserted_at
                             |> DateTime.to_naive
                             |> NaiveDateTime.add(lifespan, :second)
                             |> DateTime.from_naive("Etc/UTC")
       changes
       |> put_change(:expires_at, expires_at)
      _ ->
        changes
    end
  end


  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}, user_id) do
    asset_struct = Map.put(struct, :user_id, user_id)
    asset_struct
    |> cast(params, [:name, :location_id, :user_id, :lifespan, :expires_at])
    |> validate_required([:name, :location_id, :user_id])
    |> set_expiration()
  end
end
