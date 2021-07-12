defmodule MarvelService.ExtApis.Utils do
  @moduledoc false

  @doc """
  Parses a tesla request un a tuple response
  """
  @spec parse_response(any) ::
          {:error, any}
          | {:client_error, map(), pos_integer()}
          | {:external_error, map(), pos_integer()}
          | {:ok, map(), pos_integer()}
  def parse_response({:ok, %Tesla.Env{status: status, body: body}})
      when status >= 200 and status < 300 do
    {:ok, body, status}
  end

  def parse_response({:ok, %Tesla.Env{status: status, body: body}})
      when status >= 400 and status < 500 do
    {:client_error, body, status}
  end

  def parse_response({:ok, %Tesla.Env{status: status, body: body}}) when status >= 500 do
    {:external_error, body, status}
  end

  def parse_response(res) do
    {:error, res}
  end

  def get_first_error_message(error) do
    first_error = error["errors"] |> List.first()

    error_message = first_error["errorMessage"]

    "Error on service: #{error["microservice"]} - #{error_message}"
  end
end
