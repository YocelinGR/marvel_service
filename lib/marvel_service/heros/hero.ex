defmodule MarvelService.Accounts.Hero do
  @moduledoc """
    This module stores all the information of an account related to a company.
    The accounts will have multiple related account_operations.
    By default a company will always have at least one account.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "hero" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(hero, attrs) do
    hero
    |> cast(attrs, [
      :name
    ])
    |> validate_required([
      :name
    ])
  end
end
