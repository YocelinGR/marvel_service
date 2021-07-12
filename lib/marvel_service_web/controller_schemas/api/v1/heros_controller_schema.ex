defmodule MarvelServiceWeb.Api.V1.HerosControllerSchema do
  @moduledoc """
    Embebed schema for related sales to an account operation
  """
  use MarvelServiceWeb, :schema

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :name, :string
  end

  def changeset(hero, attrs) do
    hero
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end
