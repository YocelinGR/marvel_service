defmodule MarvelServiceWeb.Api.V1.FallbackController do
  use MarvelServiceWeb, :controller

  alias MarvelServiceWeb.API.V1.ChangesetView
  alias MarvelServiceWeb.ErrorView

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, _, %Ecto.Changeset{} = changeset, _}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:bad_request, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, _}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render("404.json")
  end

  def call(conn, {:error, :not_found, reason}) do
    conn
    |> put_status(:not_found)
    |> json(%{"reason" => reason})
  end

  def call(conn, {:error, :unprocessable_entity, reason}) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{"reason" => reason})
  end
end
