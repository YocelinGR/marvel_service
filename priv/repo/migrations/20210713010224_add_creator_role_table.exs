defmodule MarvelService.Repo.Migrations.AddCreatorRoleTable do
  use Ecto.Migration

  def change do
    create table(:creator_role) do
      add :name, :string, null: false

      timestamps()
    end
  end
end
