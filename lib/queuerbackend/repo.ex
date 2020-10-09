defmodule Queuerbackend.Repo do
  use Ecto.Repo,
    otp_app: :queuerbackend,
    adapter: Ecto.Adapters.Postgres
end
