defmodule MarvelService.Scheduler.MarvelScheduler do
  @moduledoc """
  Contains functions that the MarvelService will execute and affect the context sales
  """
  import Ecto.Query

  alias MarvelService.Repo

  @doc """
  Sync main heros information: basic info, secundary heros, comics and comic´s collaborators.
  """
  @spec sync_main_hero_information(DateTime.t(), String.t()) :: {integer(), nil}
  def sync_main_hero_information(datetime, time_zone) do

  end
end
