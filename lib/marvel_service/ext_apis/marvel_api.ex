defmodule MarvelService.ExtApis.MarvelApi do
  @moduledoc """
  Contains operations to interact with core-utils micro service
  """
  use Tesla
  alias MarvelService.ExtApis.Utils

  require Logger

  plug Tesla.Middleware.Logger

  plug Tesla.Middleware.BaseUrl,
       Application.get_env(:marvel_service, :marvel_api_base_url)

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Timeout, timeout: 30_000

  # MarvelService.ExtApis.MarvelApi.get_hero_by_id(1009220)
  def get_hero_by_id(hero_id) do
    marvel_keys = get_access_keys()

    "v1/public/characters/#{hero_id}?ts=#{marvel_keys.timestamp}&apikey=#{
      marvel_keys.marvel_public_key
    }&hash=#{marvel_keys.md5_key}"
    |> get()
    |> Utils.parse_response()
  end

  # MarvelService.ExtApis.MarvelApi.get_comics_by_hero(1009220)
  def get_comics_by_hero(hero_id) do
    marvel_keys = get_access_keys()

    "v1/public/characters/#{hero_id}/comics?ts=#{marvel_keys.timestamp}&apikey=#{
      marvel_keys.marvel_public_key
    }&hash=#{marvel_keys.md5_key}"
    |> get()
    |> Utils.parse_response()
  end

  defp get_access_keys() do
    marvel_public_key = Application.get_env(:marvel_service, :marvel_public_key)
    marvel_private_key = Application.get_env(:marvel_service, :marvel_private_key)
    datetime = DateTime.utc_now()
    timestamp = DateTime.to_unix(datetime)

    md5_key =
      :crypto.hash(:md5, "#{timestamp}#{marvel_private_key}#{marvel_public_key}")
      |> Base.encode16()
      |> String.downcase()

    %{
      marvel_public_key: marvel_public_key,
      md5_key: md5_key,
      timestamp: timestamp
    }
  end
end
