# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :sapients,
  ecto_repos: [Sapients.Repo]

# Configures the endpoint
config :sapients, SapientsWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SapientsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sapients.PubSub,
  live_view: [signing_salt: "WZMRWaIl"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :sapients, Sapients.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2018 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Tailwindcss
config :tailwind, version: "3.1.6", default: [
  args: ~w(
    --config=tailwind.config.js
    --input=css/app.css
    --output=../priv/static/assets/app.css
  ),
  cd: Path.expand("../assets", __DIR__)
]

config :sapients,
  imagekit_url: "https://ik.imagekit.io/soulgenesis",
  bucket: "sapimedia",
  oai_token: System.get_env("OAI_TOKEN"),
  replicate_token: System.get_env("REPLICATE_TOKEN"),
  social_links: [
      "https://twitter.com/sapientsart",
      "https://behance.net/sapients",
      "https://t.me/sapientschannel",
  ]

config :ex_aws,
  debug_requests: true,
  json_codec: Jason,
  access_key_id: {:system, "SPACES_ACCESS_KEY_ID"},
  secret_access_key: {:system, "SPACES_SECRET_ACCESS_KEY"}


config :ex_aws, :s3,
  scheme: "https://",
  host: "fra1.digitaloceanspaces.com",
  region: "fra1"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
