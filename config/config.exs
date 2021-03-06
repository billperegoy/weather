# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weather,
  ecto_repos: [Weather.Repo]

# Configures the endpoint
config :weather, WeatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VSCWO5+hvBXub8f5uRPZBF3Uw1LGA1y/5vnbJjqiXOSMi+sLqALnuAYqQQxeNpBT",
  render_errors: [view: WeatherWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Weather.PubSub,
  live_view: [signing_salt: "FlRKipxe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
