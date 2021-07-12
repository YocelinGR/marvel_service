defmodule MarvelService.ExtApis.MarvelApi do
  @moduledoc """
  Contains operations to interact with core-utils micro service
  """
  use Tesla
  alias MarvelService.ExtApis.MarvelApi
  alias MarvelService.ExtApis.Utils

  require Logger

  plug Tesla.Middleware.Logger

  plug Tesla.Middleware.BaseUrl,
       Application.get_env(:marvel_service, :marvel_api_base_url)

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Timeout, timeout: 30_000

  def get_hero_by_id(hero_id) do
    ""
    |> get(headers: [{"company-number", ""}])
    |> Utils.parse_response()
  end
end
