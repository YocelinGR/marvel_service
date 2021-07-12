# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :marvel_service,
  ecto_repos: [MarvelService.Repo]

# Configures the endpoint
config :marvel_service, MarvelServiceWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    view: MarvelServiceWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: MarvelService.PubSub,
  live_view: [signing_salt: "XlBPhvmv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Timezone database
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

# Scheduler configuration
config :marvel_service,
  # configure the time zones used to start each process to pass a expected paymento to overdue
  timezones: [
    "America/Mexico_City",
    "America/Tijuana",
    "America/Chihuahua",
    "America/Hermosillo",
    "America/Mazatlan",
    "America/Cancun",
    "America/Matamoros"
  ],
  # configure when expected payments scheduler will run on each time zone
  # Every day at 2am
  expected_payments_job: "0 2 * * *"

config :tesla, adapter: Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
