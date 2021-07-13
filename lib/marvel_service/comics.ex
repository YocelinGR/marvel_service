defmodule MarvelService.Comics do
  @moduledoc """
    This module contains the operations that are
    carried out on the comics
  """
  import Ecto.Query
  alias Ecto.Multi

  alias MarvelService.Repo
  alias MarvelService.Comic.Comic

  @doc """
    Returns a list of all comics
    ### Examples
      iex> list_comic()
      [%Comic{}]

      iex> list_comic()
      []
  """
  @spec list_comic() :: list(Comic.t())
  def list_comic do
    Repo.all(Comic)
  end

  @doc """
    Returns a Comic by id
     ### Examples
      iex> get_comic_by_id(123)
      {:ok, %Comic{}}

      iex> get_comic_by_id(345)
      {:error, "comic not found"}
  """
  @spec get_comic_by_id(pos_integer()) ::
          {:ok, Comic.t()} | {:error, String.t()}
  def get_comic_by_id(id) do
    Comic
    |> Repo.get_by(id: id)
    |> case do
      nil -> {:error, "comic not found"}
      comic -> {:ok, comic}
    end
  end

  @doc """
    Returns a Comic by comic_marvel_id
     ### Examples
      iex> get_comic_by_marvel_id(123)
      {:ok, %Comic{}}

      iex> get_comic_by_marvel_id(345)
      {:error, "comic not found"}
  """
  @spec get_comic_by_marvel_id(pos_integer()) ::
          {:ok, Comic.t()} | {:error, String.t()}
  def get_comic_by_marvel_id(comic_marvel_id) do
    Comic
    |> Repo.get_by(comic_marvel_id: comic_marvel_id)
    |> case do
      nil -> {:error, "comic not found"}
      comic -> {:ok, comic}
    end
  end

  @doc """
    Creates a comic.
    ### Examples
      iex> create_comic(%{field: value})
      {:ok, %Comic{}}

      iex> create_comic(%{field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec create_comic(map) ::
          {:ok, Comic.t()} | {:error, Ecto.Changeset.t()}
  def create_comic(attrs \\ %{}) do
    %Comic{}
    |> Comic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Updates a comic by id
    ### Examples
      iex> update_comic(%Comic{}, %{field: value})
      {:ok, %Comic{}}

      iex> update_comic(%Comic{}, %{invalid_field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec update_comic(Comic.t(), Map.t()) :: {:ok, Comic.t()} | {:error, Ecto.Changeset.t()}
  def update_comic(%Comic{} = comic, attrs) do
    comic
    |> Comic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Delete a comic by id
    ### Examples
      iex> delete_comic(1)
      {:ok, %comic{}}

      iex> delete_comic(1)
      {:error, %Ecto.Changeset{}}
  """
  @spec delete_comic(pos_integer()) ::
          {:ok, Comic.t()} | {:error, Ecto.Changeset.t()}
  def delete_comic(comic_id) do
    comic = Repo.get!(Comic, comic_id)

    case Repo.delete(comic) do
      {:ok, comic} -> {:ok, comic}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
