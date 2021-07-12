defmodule MarvelServiceWeb.Api.V1.HerosView do
  use MarvelServiceWeb, :view

  def render("show.json", %{hero: hero}) do
    %{
      data: render_one(hero, __MODULE__, "hero.json", as: :hero)
    }
  end

  def render("hero.json", %{hero: hero}) do
    %{
      id: hero.id,
      name: hero.name,
      last_sync: hero.last_sync
    }
  end
end
