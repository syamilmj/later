defmodule Later.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Later.Worker.start_link(arg)
      # {Later.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Later.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
