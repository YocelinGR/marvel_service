defmodule MarvelService.Repo.Migrations.AddHeroComicsTable do
  use Ecto.Migration

  def change do
    create table(:heros_comics) do
      add :hero_id, references(:hero)
      add :is_hero_main_character, :boolean, default: false
      add :comic_id, references(:comic)

      timestamps()
    end

    create index(:heros_comics, [:hero_id])
    create index(:heros_comics, [:comic_id])
    create unique_index(:heros_comics, [:hero_id, :comic_id])
  end
end
