defmodule Clon3.Repo do
  use Ecto.Repo,
    otp_app: :clon3,
    adapter: Ecto.Adapters.Postgres
end
