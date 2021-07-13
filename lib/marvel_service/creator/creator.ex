defmodule MarvelService.Creator.Creator do
  @moduledoc """
  This modules works over the creator module. Define its fields and its rules.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias MarvelService.Creator.CreatorRole
  alias MarvelService.Comic.Comic

  schema "creator" do
    field :name, :string
    field :creator_marvel_id, :integer

    belongs_to :creator_role, CreatorRole, foreign_key: :creator_role_id
    belongs_to :comic, Comic, foreign_key: :comic_id

    timestamps()
  end

  @doc false
  def changeset(creator, attrs) do
    creator
    |> cast(attrs, [
      :name,
      :creator_marvel_id,
      :creator_role_id,
      :comic_id
    ])
    |> validate_required([
      :name,
      :creator_marvel_id,
      :creator_role_id,
      :comic_id
    ])
    |> foreign_key_constraint(:creator_role_id)
    |> foreign_key_constraint(:comic_id)
    |> unique_constraint(:creator_marvel_id)
  end
end
