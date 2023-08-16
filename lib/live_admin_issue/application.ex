defmodule LiveAdminIssue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveAdminIssueWeb.Telemetry,
      # Start the Ecto repository
      LiveAdminIssue.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveAdminIssue.PubSub},
      # Start Finch
      {Finch, name: LiveAdminIssue.Finch},
      # Start the Endpoint (http/https)
      LiveAdminIssueWeb.Endpoint
      # Start a worker by calling: LiveAdminIssue.Worker.start_link(arg)
      # {LiveAdminIssue.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveAdminIssue.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveAdminIssueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
