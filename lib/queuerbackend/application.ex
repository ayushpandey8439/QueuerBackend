defmodule Queuerbackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Queuerbackend.Repo,
      # Start the Telemetry supervisor
      QueuerbackendWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Queuerbackend.PubSub},
      # Start the Endpoint (http/https)
      QueuerbackendWeb.Endpoint
      # Start a worker by calling: Queuerbackend.Worker.start_link(arg)
      # {Queuerbackend.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Queuerbackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    QueuerbackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
