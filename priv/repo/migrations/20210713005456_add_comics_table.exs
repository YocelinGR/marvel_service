defmodule MarvelService.Repo.Migrations.AddComicsTable do
  use Ecto.Migration

  def change do
    create table(:comic) do
      add :comic_marvel_id, :integer, null: false
      add :name, :string, null: false
      add :number, :integer, null: true

      timestamps()
    end

    create index(:comic, [:comic_marvel_id])
  end
end
