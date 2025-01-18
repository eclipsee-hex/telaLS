defmodule Tela.Repo do
  use Ecto.Repo,
    otp_app: :tela,
    adapter: Ecto.Adapters.Postgres
end
