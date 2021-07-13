defmodule MarvelServiceWeb.Api.V1.HerosView do
  use MarvelServiceWeb, :view

  def render("hero_creators.json", %{hero: hero}) do
    %{
      id: hero.id,
      name: hero.name,
      last_sync: hero.last_sync,
      description: hero.description,
      comics_amount: hero.comics_amount,
      marvel_id: hero.marvel_id,
      modified: hero.modified
    }
  end
end
