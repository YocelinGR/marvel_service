defmodule MarvelService.Hero do
  @moduledoc """
    This module contains the operations that are
    carried out on the heros
  """
  import Ecto.Query
  alias Ecto.Multi

  alias MarvelService.Repo
  alias MarvelService.Hero.{Hero, HerosComics}
  alias MarvelService.Comic.Comic
  alias MarvelService.Creator.{Creator, CreatorRole}

  @doc """
    Returns a list of all Heros
    ### Examples
      iex> list_heros()
      [%Hero{}]

      iex> list_heros()
      []
  """
  @spec list_heros() :: list(Hero.t())
  def list_heros do
    Repo.all(Hero)
  end

  @doc """
    Returns a Hero by id
     ### Examples
      iex> get_hero_by_id(123)
      {:ok, %Hero{}}

      iex> get_hero_by_id(345)
      {:error, "Hero not found"}
  """
  @spec get_hero_by_id(pos_integer()) ::
          {:ok, Hero.t()} | {:error, String.t()}
  def get_hero_by_id(id) do
    Hero
    |> Repo.get_by(id: id)
    |> case do
      nil -> {:error, "Hero not found"}
      hero -> {:ok, hero}
    end
  end

  @doc """
    Returns a Hero by marvel_id
     ### Examples
      iex> get_hero_by_marvel_id(123)
      {:ok, %Hero{}}

      iex> get_hero_by_marvel_id(345)
      {:error, "Hero not found"}
  """
  @spec get_hero_by_marvel_id(pos_integer()) ::
          {:ok, Hero.t()} | {:error, String.t()}
  def get_hero_by_marvel_id(marvel_id) do
    Hero
    |> Repo.get_by(marvel_id: marvel_id)
    |> case do
      nil -> {:error, "Hero not found"}
      hero -> {:ok, hero}
    end
  end

  @doc """
    Creates a Hero.
    ### Examples
      iex> create_hero(%{field: value})
      {:ok, %Hero{}}

      iex> create_hero(%{field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec create_hero(map) ::
          {:ok, Hero.t()} | {:error, Ecto.Changeset.t()}
  def create_hero(attrs \\ %{}) do
    %Hero{}
    |> Hero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Updates a Hero by id
    ### Examples
      iex> update_hero(%Hero{}, %{field: value})
      {:ok, %Hero{}}

      iex> update_hero(%Hero{}, %{invalid_field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec update_hero(Hero.t(), Map.t()) :: {:ok, Hero.t()} | {:error, Ecto.Changeset.t()}
  def update_hero(%Hero{} = hero, attrs) do
    hero
    |> Hero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Delete a Hero by id
    ### Examples
      iex> delete_hero(1)
      {:ok, %Hero{}}

      iex> delete_hero(1)
      {:error, %Ecto.Changeset{}}
  """
  @spec delete_hero(pos_integer()) ::
          {:ok, Hero.t()} | {:error, Ecto.Changeset.t()}
  def delete_hero(hero_id) do
    hero = Repo.get!(Hero, hero_id)

    case Repo.delete(hero) do
      {:ok, hero} -> {:ok, hero}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @doc """
    Returns a list of all HerosComics
    ### Examples
      iex> list_heros_comic()
      [%HerosComics{}]

      iex> list_heros_comic()
      []
  """
  @spec list_heros_comic() :: list(HerosComics.t())
  def list_heros_comic do
    Repo.all(HerosComics)
  end

  @doc """
    Returns a HerosComics by hero id
     ### Examples
      iex> get_heros_comics_by_hero_id(123)
      {:ok, %HerosComics{}}

      iex> get_heros_comics_by_hero_id(345)
      {:error, "Hero not found"}
  """
  @spec get_heros_comics_by_hero_id(pos_integer()) ::
          {:ok, HerosComics.t()} | {:error, String.t()}
  def get_heros_comics_by_hero_id(id) do
    HerosComics
    |> Repo.get_by(hero_id: id)
    |> case do
      nil -> {:error, "HerosComics not found"}
      hero_comic -> {:ok, hero_comic}
    end
  end

  @doc """
    Returns a HerosComics by comic_id
     ### Examples
      iex> get_heros_comics_by_comic_id(123)
      {:ok, %HerosComics{}}

      iex> get_heros_comics_by_comic_id(345)
      {:error, "HerosComics not found"}
  """
  @spec get_heros_comics_by_comic_id(pos_integer()) ::
          {:ok, HerosComics.t()} | {:error, String.t()}
  def get_heros_comics_by_comic_id(comic_id) do
    HerosComics
    |> Repo.get_by(comic_id: comic_id)
    |> case do
      nil -> {:error, "HerosComics not found"}
      hero_comics -> {:ok, hero_comics}
    end
  end

  @doc """
    Creates a HerosComics.
    ### Examples
      iex> create_heros_comis(%{field: value})
      {:ok, %HerosComics{}}

      iex> create_heros_comis(%{field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec create_heros_comis(map) ::
          {:ok, HerosComics.t()} | {:error, Ecto.Changeset.t()}
  def create_heros_comis(attrs \\ %{}) do
    %HerosComics{}
    |> HerosComics.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Updates a HerosComics by id
    ### Examples
      iex> update_heros_comics(%HerosComics{}, %{field: value})
      {:ok, %HerosComics{}}

      iex> update_heros_comics(%HerosComics{}, %{invalid_field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec update_heros_comics(HerosComics.t(), Map.t()) ::
          {:ok, HerosComics.t()} | {:error, Ecto.Changeset.t()}
  def update_heros_comics(%HerosComics{} = heros_comics, attrs) do
    heros_comics
    |> HerosComics.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Delete a HerosComics by id
    ### Examples
      iex> delete_heros_comics(1)
      {:ok, %HerosComics{}}

      iex> delete_heros_comics(1)
      {:error, %Ecto.Changeset{}}
  """
  @spec delete_heros_comics(pos_integer()) ::
          {:ok, HerosComics.t()} | {:error, Ecto.Changeset.t()}
  def delete_heros_comics(id) do
    heros_comics = Repo.get!(HerosComics, id)

    case Repo.delete(heros_comics) do
      {:ok, heros_comics} -> {:ok, heros_comics}
      {:error, changeset} -> {:error, changeset}
    end
  end

  defp get_hero_creators(hero_id) do
    HerosComics
    |> where([hc], hc.hero_id == ^hero_id)
    |> join(:left, [hc], c in Comic, on: hc.comic_id == c.id)
    |> join(:left, [_hc, c], cr in Creator, on: c.id == cr.comic_id)
    |> join(:left, [_hc, _c, cr], crr in CreatorRole, on: cr.creator_role_id == crr.id)
    |> select([_hc, _c, cr, crr], %{role: crr.name, name: cr.name})
    |> Repo.all()
  end

  defp get_hero_comic_ids(hero_id) do
    Comic
    |> join(:left, [c], hc in HerosComics, on: c.id == hc.comic_id)
    |> where([_c, hc], hc.hero_id == ^hero_id)
    |> select([c, _hc], c.id)
    |> Repo.all()
  end

  defp get_hero_secundary_heroes(comic_ids) do
    Hero
    |> join(:left, [h], hc in HerosComics, on: h.id == hc.hero_id)
    |> join(:left, [h, hc], c in Comic, on: hc.comic_id == c.id)
    |> where([_h, hc, _c], hc.comic_id in ^comic_ids)
    |> select([h, _hc, _c], %{character: h.name, id: h.id})
    |> Repo.all()
  end

  defp get_hero_comics(hero_id) do
    HerosComics
    |> join(:left, [hc], c in Comic, on: hc.comic_id == c.id)
    |> where([hc, c], hc.hero_id == ^hero_id)
    |> select([_hc, c], c.name)
    |> Repo.all()
  end

  @spec get_hero_info(Hero.t(), String.t() | nil) ::
          {:ok, Map.t()}
  def get_hero_info(hero, "creators") do
    creators =
      get_hero_creators(hero.id)
      |> Enum.group_by(& &1.role)

    map_hero = Map.merge(hero, creators)
    {:ok, map_hero}
  end

  def get_hero_info(hero, "heros") do
    hero_comics = get_hero_comic_ids(hero.id)

    secundary_heroes = get_hero_secundary_heroes(hero_comics)

    secundary_heros_comics =
      secundary_heroes
      |> Enum.map(fn shero ->
        comics = get_hero_comics(shero.id)

        %{
          character: shero.character,
          comics: comics
        }
      end)

    map_hero = Map.merge(hero, %{characters: secundary_heros_comics})

    {:ok, map_hero}
  end

  def get_hero_info(hero, _) do
    {:ok, creators} = get_hero_info(hero, "creators")

    {:ok, heros} = get_hero_info(hero, "heros")

    map_hero =
      creators
      |> Map.merge(heros)

    {:ok, map_hero}
  end
end
