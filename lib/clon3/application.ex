defmodule Clon3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Clon3.Repo,
      # Start the Telemetry supervisor
      Clon3Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Clon3.PubSub},
      # Start the Endpoint (http/https)
      Clon3Web.Endpoint
      # Start a worker by calling: Clon3.Worker.start_link(arg)
      # {Clon3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Clon3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Clon3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
