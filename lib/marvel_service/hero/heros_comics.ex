defmodule MarvelService.Hero.HerosComics do
  @moduledoc """
  Thi module have the relationship between the comic and hero schemas
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias MarvelService.Hero.Hero
  alias MarvelService.Comic.Comic

  schema "sale_payments_operations" do
    field :is_hero_main_character, :boolean, default: false

    belongs_to :hero, Hero

    belongs_to :comic, Comic

    timestamps()
  end

  @doc false
  def changeset(sale_payments_operations, attrs) do
    sale_payments_operations
    |> cast(attrs, [
      :is_hero_main_character,
      :hero_id,
      :comic_id
    ])
    |> validate_required([
      :is_hero_main_character,
      :hero_id,
      :comic_id
    ])
    |> unique_constraint([:hero_id, :comic_id])
  end
end
