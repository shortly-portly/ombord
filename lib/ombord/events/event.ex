defmodule Ombord.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :issue, :date
    field :due, :date
    field :completed, :date

    belongs_to :activity, Ombord.Activities.Activity
    belongs_to :user, Ombord.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:issue, :due, :activity_id, :user_id])
    |> validate_required([:issue, :due, :activity_id, :user_id])
  end
end
