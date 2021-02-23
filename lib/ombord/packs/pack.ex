defmodule Ombord.Packs.Pack do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packs" do
    field :role, :string
    field :team_leader, :string
    field :probationary_review_date, :date
    field :start_date, :date

    belongs_to :user, Ombord.Accounts.User

    timestamps()
  end

  @valid_attrs [
    :role,
    :team_leader,
    :probationary_review_date,
    :start_date
  ]

  @doc false
  def changeset(pack, attrs) do
    pack
    |> cast(attrs, @valid_attrs)
    |> validate_required(@valid_attrs)
  end
end
