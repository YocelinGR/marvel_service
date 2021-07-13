defmodule MarvelServiceWeb.Api.V1.HerosControllerSchema do
  @moduledoc """
    Embebed schema for related sales to an account operation
  """
  use MarvelServiceWeb, :schema

  @hero_names ["ironman", "capamerica"]
  @type_actions ["all", "creators", "heros"]

  @primary_key false
  embedded_schema do
    field :hero_name, :string
    field :type_action, :string, default: ""
  end

  def changeset(:get_hero, attrs) do
    %__MODULE__{}
    |> cast(attrs, [:hero_name, :type_action])
    |> validate_required([:hero_name])
    |> validate_inclusion(:hero_name, @hero_names)
    |> validate_inclusion(:type_action, @type_actions)
    |> set_default(:type_action, "all")
  end
end
