defmodule MarvelServiceWeb.Api.V1.HerosController do
  @moduledoc """
  Definition of the params and headers received for HerosController module
  """
  use MarvelServiceWeb, :controller
  require Logger
  action_fallback MarvelServiceWeb.Api.V1.FallbackController

  def get_hero(conn, %{"hero_name" => hero_name}) do
    Logger.info("hero_name: #{hero_name}")

    send_resp(conn, :ok, "Get hero")
  end
end
