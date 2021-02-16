defmodule Ombord.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :name, :string
      add :function, :string
      add :purpose, :string
      add :issue, :int
      add :due, :int
      add :communication_method, :string
      add :personnel, :string

      add :template_id, references(:templates)

      timestamps()
    end

  end
end
