defmodule MarvelService.Repo.Migrations.AddCreatorTable do
  use Ecto.Migration

  def change do
    create table(:creator) do
      add :name, :string, null: false
      add :creator_marvel_id, :integer, null: false
      add :role_id, references(:creator_role)

      timestamps()
    end

    create index(:creator, [:creator_marvel_id])
    create index(:creator, [:creator_marvel_id, :role_id])
  end
end
