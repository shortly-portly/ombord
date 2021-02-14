defmodule Ombord.Activities.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :name, :string
    field :function, :string
    field :purpose, :string
    field :issue, :integer
    field :due, :integer
    field :communication_method, :string
    field :personnel, :string

    timestamps()
  end

  @valid_attrs [:name, :function, :purpose, :issue, :due, :communication_method, :personnel]
  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, @valid_attrs)
    |> validate_required([:name])
  end
end
