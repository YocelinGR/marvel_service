defmodule MarvelService.Repo.Migrations.InsertCreatorRoles do
  use Ecto.Migration

  def up do
    execute "
    INSERT INTO creator_role
    (name, inserted_at, updated_at)
    VALUES
    ('penciler', now(), now()),
    ('writer', now(), now()),
    ('penciler (cover)', now(), now()),
    ('inker', now(), now()),
    ('colorist', now(), now()),
    ('colorist (cover)', now(), now()),
    ('editor', now(), now()),
    ('letterer', now(), now());
   "
  end

  def down do
    execute "DELETE FROM creator_role"
  end
end
