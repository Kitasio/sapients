defmodule Sapients.Repo do
  use Ecto.Repo,
    otp_app: :sapients,
    adapter: Ecto.Adapters.Postgres
end
