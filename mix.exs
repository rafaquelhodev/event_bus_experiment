defmodule DecoupleEventBus.MixProject do
  use Mix.Project

  def project do
    [
      app: :decouple_event_bus,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :event_bus],
      mod: {DecoupleEventBus.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:event_bus, "~> 1.7.0"}
    ]
  end
end
