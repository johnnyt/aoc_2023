defmodule AdventOfCode.MixProject do
  use Mix.Project

  @app :aoc
  @version "0.1.0"
  @deps [
    {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
    {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
  ]

  @spec application() :: keyword
  def application() do
    [
      extra_applications: [:logger]
    ]
  end

  @spec project() :: keyword
  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: @deps
    ]
  end
end
