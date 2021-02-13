# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ombord,
  ecto_repos: [Ombord.Repo]

# Configures the endpoint
config :ombord, OmbordWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sQozzCWNkJFxUJ1gXtCjGTFpqQBJZRG5KMDWuMTvWWGVKr64X/U0VF7LDnoYlwQJ",
  render_errors: [view: OmbordWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ombord.PubSub,
  live_view: [signing_salt: "a/xpib4Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
