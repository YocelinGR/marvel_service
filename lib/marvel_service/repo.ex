defmodule MarvelService.Repo do
  use Ecto.Repo,
    otp_app: :marvel_service,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 50
end
