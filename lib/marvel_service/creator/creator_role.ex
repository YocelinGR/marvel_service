defmodule MarvelService.Creator.CreatorRole do
  @moduledoc """
  Catalog of the creator´s role
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias MarvelService.Creator.Creator

  schema "creator_role" do
    field :name, :string

    has_many :creator, Creator
  end

  @doc false
  def changeset(creator_role, attrs) do
    creator_role
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
