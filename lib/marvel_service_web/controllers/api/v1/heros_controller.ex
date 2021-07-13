defmodule MarvelServiceWeb.Api.V1.HerosController do
  @moduledoc """
  Definition of the params and headers received for HerosController module
  """
  use MarvelServiceWeb, :controller

  alias MarvelServiceWeb.Api.V1.HerosControllerSchema
  alias MarvelService.Hero

  action_fallback MarvelServiceWeb.Api.V1.FallbackController

  @main_hero_ids %{
    ironman: 1_009_368,
    capamerica: 1_009_220
  }

  require Logger

  def get_hero(conn, %{"hero_name" => hero_name} = params) do
    with {:ok, params} <- validate_schema(:get_hero, HerosControllerSchema, params),
         {:ok, hero_marvel_id} <- get_main_hero_marvel_id(hero_name),
         {:ok, hero} <- Hero.get_hero_by_marvel_id(hero_marvel_id) do
      {:ok, hero_response} = Hero.get_hero_info(hero, params.type_action)

      response =
        Poison.encode!(hero_response)
        |> Poison.decode!()
        |> Map.delete("heros_comics")
        |> Map.delete("__meta__")

      Logger.info("hero: #{inspect(hero_response)}")
      json(conn, response)
    else
      {:error, "Main hero not allowed"} ->
        send_resp(conn, :unprocessable_entity, "Main hero not allowed")

      error ->
        error
    end
  end

  defp get_main_hero_marvel_id(hero_name) do
    case hero_name do
      "ironman" -> {:ok, @main_hero_ids.ironman}
      "capamerica" -> {:ok, @main_hero_ids.capamerica}
      _ -> {:error, "Main hero not allowed"}
    end
  end
end
