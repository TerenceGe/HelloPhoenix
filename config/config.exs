# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello_phoenix,
  ecto_repos: [HelloPhoenix.Repo]

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine
  
# Configures the endpoint
config :hello_phoenix, HelloPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YlzF1n7ZB/VPcNyE405yBJPHbR5qtRcIezp3BcrroMIWetgn35Ul2FCS86wZh83j",
  render_errors: [view: HelloPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_admin,
  repo: HelloPhoenix.Repo,
  module: HelloPhoenix,
  modules: [
    HelloPhoenix.ExAdmin.Dashboard,
    HelloPhoenix.ExAdmin.User
  ]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}
