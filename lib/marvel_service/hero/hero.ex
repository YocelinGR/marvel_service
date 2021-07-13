defmodule MarvelService.Hero.Hero do
  @moduledoc """
  This module manage the heros module.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias MarvelService.Hero.HerosComics

  schema "hero" do
    field :marvel_id, :integer
    field :name, :string
    field :description, :string
    field :modified, :utc_datetime
    field :last_sync, :utc_datetime
    field :comics_amount, :integer

    many_to_many :heros_comics, HerosComics,
      join_through: "heros_comics"

    timestamps()
  end

  @doc false
  def changeset(hero, attrs) do
    hero
    |> cast(attrs, [
      :marvel_id,
      :name,
      :description,
      :modified,
      :last_sync,
      :comics_amount
    ])
    |> validate_required([
      :marvel_id,
      :name,
      :modified,
      :last_sync,
      :comics_amount
    ])
  end
end
