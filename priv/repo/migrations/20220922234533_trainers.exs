defmodule ExMonApi.Repo.Migrations.Trainers do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :password_hash, :string
      add :password, :string, virtual: true
      timestamps()
    end
  end
end
