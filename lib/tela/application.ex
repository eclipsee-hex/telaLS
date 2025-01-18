defmodule Tela.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TelaWeb.Telemetry,
      Tela.Repo,
      {DNSCluster, query: Application.get_env(:tela, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Tela.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Tela.Finch},
      # Start a worker by calling: Tela.Worker.start_link(arg)
      # {Tela.Worker, arg},
      # Start to serve requests, typically the last entry
      TelaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tela.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TelaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
