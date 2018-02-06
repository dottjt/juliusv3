# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :portfolio,
  ecto_repos: [Portfolio.Repo]

# Configures the endpoint
config :portfolio, PortfolioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UNKdw3n8t1imKvRmolBW70P8kXjh6WHtGVidb+XBhxHX146Zo1KfYobmiWnGCmrF",
  render_errors: [view: PortfolioWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Portfolio.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Portfolio.Coherence.User,
  repo: Portfolio.Repo,
  module: Portfolio,
  web_module: PortfolioWeb,
  router: PortfolioWeb.Router,
  messages_backend: PortfolioWeb.Coherence.Messages,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%
