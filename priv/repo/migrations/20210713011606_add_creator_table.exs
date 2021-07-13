defmodule MarvelService.Repo.Migrations.AddCreatorTable do
  use Ecto.Migration

  def change do
    create table(:creator) do
      add :name, :string, null: false
      add :creator_marvel_id, :integer, null: false
      add :creator_role_id, references(:creator_role)
      add :comic_id, references(:comic)

      timestamps()
    end

    create index(:creator, [:creator_marvel_id])
    create index(:creator, [:creator_marvel_id, :creator_role_id])
    create index(:creator, [:creator_marvel_id, :comic_id])
  end
end
