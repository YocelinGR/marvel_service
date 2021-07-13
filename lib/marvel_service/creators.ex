defmodule MarvelService.Creator do
  @moduledoc """
    This module contains the operations that are
    carried out on the creator
  """
  import Ecto.Query
  alias Ecto.Multi

  alias MarvelService.Repo
  alias MarvelService.Creator.{Creator, CreatorRole}

  @doc """
    Returns a list of all comic roles
    ### Examples
      iex> list_creator_roles()
      [%CreatorRole{}]

      iex> list_creator_roles()
      []
  """
  @spec list_creator_roles() :: list(CreatorRole.t())
  def list_creator_roles do
    Repo.all(CreatorRole)
  end

  @doc """
    Returns a creator role by id
     ### Examples
      iex> get_creator_role_by_id(123)
      {:ok, %Comic{}}

      iex> get_creator_role_by_id(345)
      {:error, "comic not found"}
  """
  @spec get_creator_role_by_id(pos_integer()) ::
          {:ok, CreatorRole.t()} | {:error, String.t()}
  def get_creator_role_by_id(id) do
    CreatorRole
    |> Repo.get_by(id: id)
    |> case do
      nil -> {:error, "CreatorRole not found"}
      comic -> {:ok, comic}
    end
  end

  @doc """
    Returns a CreatorRole by name
     ### Examples
      iex> get_creator_role_by_name("123")
      {:ok, %CreatorRole{}}

      iex> get_creator_role_by_name("345")
      {:error, "CreatorRole not found"}
  """
  @spec get_creator_role_by_name(pos_integer()) ::
          {:ok, CreatorRole.t()} | {:error, String.t()}
  def get_creator_role_by_name(creator_role_name) do
    CreatorRole
    |> Repo.get_by(name: creator_role_name)
    |> case do
      nil -> {:error, "CreatorRole not found"}
      creatorRole -> {:ok, creatorRole}
    end
  end

  @doc """
    Creates a creator_role.
    ### Examples
      iex> create_creator_role(%{field: value})
      {:ok, %CreatorRole{}}

      iex> create_creator_role(%{field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec create_creator_role(map) ::
          {:ok, CreatorRole.t()} | {:error, Ecto.Changeset.t()}
  def create_creator_role(attrs \\ %{}) do
    %CreatorRole{}
    |> CreatorRole.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Updates a CreatorRole by id
    ### Examples
      iex> update_creator_role(%CreatorRole{}, %{field: value})
      {:ok, %CreatorRole{}}

      iex> update_creator_role(%CreatorRole{}, %{invalid_field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec update_creator_role(CreatorRole.t(), Map.t()) ::
          {:ok, CreatorRole.t()} | {:error, Ecto.Changeset.t()}
  def update_creator_role(%CreatorRole{} = creator_role, attrs) do
    creator_role
    |> CreatorRole.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Delete a CreatorRole by id
    ### Examples
      iex> delete_creator_role(1)
      {:ok, %CreatorRole{}}

      iex> delete_creator_role(1)
      {:error, %Ecto.Changeset{}}
  """
  @spec delete_creator_role(pos_integer()) ::
          {:ok, CreatorRole.t()} | {:error, Ecto.Changeset.t()}
  def delete_creator_role(creator_role_id) do
    creator_role = Repo.get!(CreatorRole, creator_role_id)

    case Repo.delete(creator_role) do
      {:ok, creator_role} -> {:ok, creator_role}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @doc """
    Returns a list of all Creator
    ### Examples
      iex> list_creator()
      [%Creator{}]

      iex> list_creator()
      []
  """
  @spec list_creator() :: list(Creator.t())
  def list_creator do
    Repo.all(Creator)
  end

  @doc """
    Returns a Creator by id
     ### Examples
      iex> get_creator_by_id(123)
      {:ok, %Creator{}}

      iex> get_creator_by_id(345)
      {:error, "Creator not found"}
  """
  @spec get_creator_by_id(pos_integer()) ::
          {:ok, Creator.t()} | {:error, String.t()}
  def get_creator_by_id(id) do
    Creator
    |> Repo.get_by(id: id)
    |> case do
      nil -> {:error, "Creator not found"}
      creator -> {:ok, creator}
    end
  end

  @doc """
    Returns a Creator by creator_marvel_id
     ### Examples
      iex> get_creator_by_marvel_id(123)
      {:ok, %Creator{}}

      iex> get_creator_by_marvel_id(345)
      {:error, "Creator not found"}
  """
  @spec get_creator_by_marvel_id(pos_integer()) ::
          {:ok, Creator.t()} | {:error, String.t()}
  def get_creator_by_marvel_id(creator_marvel_id) do
    Creator
    |> Repo.get_by(creator_marvel_id: creator_marvel_id)
    |> case do
      nil -> {:error, "Creator not found"}
      creator -> {:ok, creator}
    end
  end

  @doc """
    Creates a Creator.
    ### Examples
      iex> create_creator(%{field: value})
      {:ok, %Creator{}}

      iex> create_creator(%{field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec create_creator(map) ::
          {:ok, Creator.t()} | {:error, Ecto.Changeset.t()}
  def create_creator(attrs \\ %{}) do
    %Creator{}
    |> Comic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Updates a Creator by id
    ### Examples
      iex> update_creator(%Creator{}, %{field: value})
      {:ok, %Creator{}}

      iex> update_creator(%Creator{}, %{invalid_field: value})
      {:error, %Ecto.Changeset{}}
  """
  @spec update_creator(Creator.t(), Map.t()) :: {:ok, Creator.t()} | {:error, Ecto.Changeset.t()}
  def update_creator(%Creator{} = creator, attrs) do
    creator
    |> Creator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Delete a Creator by id
    ### Examples
      iex> delete_creator(1)
      {:ok, %Creator{}}

      iex> delete_creator(1)
      {:error, %Ecto.Changeset{}}
  """
  @spec delete_creator(pos_integer()) ::
          {:ok, Creator.t()} | {:error, Ecto.Changeset.t()}
  def delete_creator(id) do
    creator = Repo.get!(Creator, id)

    case Repo.delete(creator) do
      {:ok, creator} -> {:ok, creator}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
