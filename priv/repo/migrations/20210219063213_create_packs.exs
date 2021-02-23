defmodule Ombord.Repo.Migrations.CreatePacks do
  use Ecto.Migration

  def change do
    create table(:packs) do
      add :role, :string
      add :team_leader, :string
      add :probationary_review_date, :date
      add :start_date, :date

      add :user_id, references(:users)

      timestamps()
    end

  end
end
