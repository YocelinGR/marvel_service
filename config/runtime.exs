import Config

# Endpoint configuration
port = String.to_integer(System.get_env("APP_PORT") || "4000")
secret_key_base = System.fetch_env!("SECRET_KEY_BASE")

config :marvel_service, MarvelServiceWeb.Endpoint,
  http: [
    port: port,
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

if Config.config_env() != :test do
  # Configure your database
  config :marvel_service, MarvelService.Repo,
    username: System.fetch_env!("SQL_USER"),
    password: System.fetch_env!("SQL_PASS"),
    database: System.fetch_env!("SQL_DATABASE"),
    hostname: System.fetch_env!("SQL_HOST"),
    port: String.to_integer(System.get_env("SQL_PORT") || "5432"),
    pool_size: 1,
    ssl: false

  config :marvel_service,
    marvel_api_base_url: System.get_env("MARVEL_API_BASE_URL"),
    marvel_public_key: System.get_env("MARVEL_PUBLIC_KEY"),
    marvel_private_key: System.get_env("MARVEL_PRIVATE_KEY")
end
