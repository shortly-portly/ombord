defmodule Ombord.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :issue, :date
      add :due, :date
      add :completed, :date

      add :activity_id, references(:activities)
      add :user_id, references(:users)

      timestamps()
    end

  end
end
