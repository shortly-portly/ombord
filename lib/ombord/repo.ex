defmodule Ombord.Repo do
  use Ecto.Repo,
    otp_app: :ombord,
    adapter: Ecto.Adapters.Postgres
end
