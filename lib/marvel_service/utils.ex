defmodule MarvelService.Utils do
  @moduledoc """
  Contains operations to manipulate data
  """

  @doc """
  Given a datetime, returns his offset and time_zone

    ## Examples
    iex> get_datetime_time_zone_and_offset(#DateTime<2020-03-03 12:00:00-05:00 -05 Etc/GMT+5>)
    {"-05", "Etc/GMT+5"}

    iex> get_datetime_time_zone_and_offset(~U[2020-03-03 12:00:00Z])
    {0, "Etc/UTC"}
  """
  @spec get_datetime_time_zone_and_offset(DateTime.t()) :: {String.t() | 0, String.t()}
  def get_datetime_time_zone_and_offset(%DateTime{} = datetime) do
    offset = if datetime.zone_abbr == "UTC", do: 0, else: datetime.zone_abbr

    {offset, datetime.time_zone}
  end
end
