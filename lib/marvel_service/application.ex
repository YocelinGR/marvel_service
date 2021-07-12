defmodule MarvelService.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MarvelService.Repo,
      # Start the Telemetry supervisor
      MarvelServiceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MarvelService.PubSub},
      # Start the Endpoint (http/https)
      MarvelServiceWeb.Endpoint,
      # Start business management scheduler
      MarvelService.Scheduler
      # Start a worker by calling: MarvelService.Worker.start_link(arg)
      # {MarvelService.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MarvelService.Supervisor]
    sup_result = Supervisor.start_link(children, opts)
    MarvelService.Scheduler.setup_jobs()
    sup_result
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MarvelServiceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
