defmodule MarvelService.Repo.Migrations.AddHeroTable do
  use Ecto.Migration

  def change do
    create table(:hero) do
      add :marvel_id, :integer, null: false
      add :name, :string, null: false
      add :description, :string, null: true
      add :modified, :utc_datetime, null: false
      add :last_sync, :utc_datetime, null: false
      add :comics_amount, :integer, null: false


      timestamps()
    end

    create index(:hero, [:marvel_id])
    create index(:hero, [:name])
  end
end
