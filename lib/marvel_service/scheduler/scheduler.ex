defmodule MarvelService.Scheduler do
  @moduledoc """
  Contains the definitions to add jobs for the recurrent tasks in this application.
  """

  use Quantum, otp_app: :marvel_service
  import Crontab.CronExpression

  alias MarvelService.Scheduler.MarvelScheduler

  require Logger

  @app_name :marvel_service

  @spec setup_jobs :: :ok
  def setup_jobs do
    setup_expected_payment_job()
  end

  defp setup_expected_payment_job do
    timezones = Application.get_env(@app_name, :timezones)

    job_schedule_sigil =
      @app_name
      |> Application.get_env(:expected_payments_job)
      |> sigil_e([])

    timezones
    |> Enum.each(fn timezone ->
      date = Timex.now(timezone) |> Timex.beginning_of_day() |> Timex.to_datetime()
      timezone_name = Timex.Timezone.name_of(timezone)
      job_name = String.to_atom("expected_payments_for_#{timezone_name}")

      new_job()
      |> Quantum.Job.set_name(job_name)
      |> Quantum.Job.set_schedule(job_schedule_sigil)
      |> Quantum.Job.set_timezone(timezone_name)
      |> Quantum.Job.set_task(fn ->
        MarvelScheduler.sync_main_hero_information(date, timezone_name)
      end)
      |> add_job()
    end)
  end
end
