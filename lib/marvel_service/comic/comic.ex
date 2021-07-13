defmodule MarvelService.Comic.Comic do
  @moduledoc """
  This modules works over the comics schema and define its field and rules.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias MarvelService.Hero.HerosComics
  alias MarvelService.Creator.Creator

  schema "comic" do
    field :comic_marvel_id, :integer
    field :name, :string
    field :number, :integer

    has_many :creator, Creator, foreign_key: :comic_id
    many_to_many :heros_comics, HerosComics, join_through: "heros_comics"

    timestamps()
  end

  @doc false
  def changeset(comic, attrs) do
    comic
    |> cast(attrs, [
      :comic_marvel_id,
      :name,
      :number
    ])
    |> validate_required([
      :comic_marvel_id,
      :name
    ])
    |> validate_number(:number, greater_than_or_equal_to: 0)
    |> unique_constraint(:comic_marvel_id)
  end
end
