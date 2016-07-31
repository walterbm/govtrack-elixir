defmodule Govtrack.Mixfile do
  use Mix.Project

  def project do
    [
      app: :govtrack,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description,
      package: package,
      deps: deps
    ]
  end

  def application do
    [applications:
      [
        :httpotion,
        :logger
      ]
    ]
  end

  defp deps do
    [
      {:httpotion, "~> 3.0.0"},
      {:poison, "~> 2.2.0"}
    ]
  end

  defp description do
    """
    An elixir wrapper for the govtrack.us API that provides programmatic access to information about the U.S. Congress.
    """
  end

  defp package do
    [
      name: :govtrack,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Walter Beller-Morales"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/walterbm/govtrack-elixir"}
    ]
  end
end
