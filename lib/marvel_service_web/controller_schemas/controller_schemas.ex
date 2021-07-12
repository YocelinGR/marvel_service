defmodule MarvelServiceWeb.ControllerSchemas do
  @moduledoc """
  Helpers to use with ControllerSchemas validations and common operations
  """

  @doc """
  Uses put_embed/3 to set default values in SchemaControllers
  """
  @spec set_default(Ecto.Changeset.t(), atom(), any()) :: Ecto.Changeset.t()
  def set_default(changeset, key, value) when is_atom(key) do
    case Map.get(changeset.changes, key) do
      nil ->
        Ecto.Changeset.put_change(changeset, key, value)

      _ ->
        changeset
    end
  end

  @doc """
    Validates an schema from a given changeset with a action defined by an atom

  ## Examples
  iex> validate_schema(:create, Sale, %{....})
  """
  @spec validate_schema(atom(), module(), map) :: {:bad_request, Ecto.Changeset} | {:ok, map()}
  def validate_schema(action, module, params) do
    changeset = module.changeset(action, params)

    case changeset.valid? do
      true ->
        {:ok, changeset.changes}

      _ ->
        {:bad_request, changeset}
    end
  end

  @spec validate_schema(module(), map) :: {:bad_request, Ecto.Changeset} | {:ok, map()}
  def validate_schema(module, params) do
    changeset = module.changeset(params)

    case changeset.valid? do
      true ->
        {:ok, changeset.changes}

      _ ->
        {:bad_request, changeset}
    end
  end

  def get_list_embed_schema([], result), do: {:ok, result}

  def get_list_embed_schema([head | tail], result),
    do: get_list_embed_schema(tail, [head.changes | result])

  @doc """
  Given a module and a list of entries validates with the module.changeset
  """
  @spec validate_schemas(atom, list(any)) :: {:ok, list()} | {:bad_request, Ecto.Changeset}
  def validate_schemas(module, entries) do
    entries
    |> validate_schemas(module, [])
  end

  defp validate_schemas([], _module, acc), do: {:ok, acc}
  defp validate_schemas(:error, _module, error_response), do: error_response

  defp validate_schemas([params | tail], module, acc) do
    case validate_schema(module, params) do
      {:ok, changes} ->
        validate_schemas(tail, module, [changes | acc])

      error_response ->
        validate_schemas(:error, module, error_response)
    end
  end
end
