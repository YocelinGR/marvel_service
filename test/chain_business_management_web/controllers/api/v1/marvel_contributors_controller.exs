defmodule MarvelServiceWeb.Api.V1.HerosControllerTest do
  @moduledoc """
  Test controller to obtain accounts by company number
  """
  use MarvelServiceWeb.ConnCase

  @valid_attrs %{}

  @invalid_attrs %{}

  describe "GET" do
    test "Basic test", %{conn: conn} do
      conn = get(conn, Routes.heros_path(conn, :index))

      assert json_response(conn, 200)
    end
  end
end
