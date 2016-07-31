# Govtrack

An elixir wrapper for the [govtrack.us](https://www.govtrack.us/developers) API that provides programmatic access to information about the U.S. Congress.

## Installation

[Available in Hex](https://hex.pm), the package can be installed by:

  1. Adding govtrack to your list of dependencies in `mix.exs`:

        def deps do
          [{:govtrack, "~> 0.0.1"}]
        end

  2. Ensuring govtrack is initialized before your main elixir application:

        def application do
          [applications: [:govtrack]]
        end
