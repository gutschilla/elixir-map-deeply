defmodule DataLeafWalker.Mixfile do
  use Mix.Project

  def project do
    [app: :data_leaf_walker,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     description: description,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  defp description do
    """
    Traverse and map values of deeply nested data structures: Provides a `map_deeply/2` function for Maps and Lists and Keyword Lists
    """
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README.md", "LICENSE", "test" ],
     maintainers: ["Martin Gutsch"],
     licenses: ["MIT"],
     links: %{
        "GitHub" => "https://github.com/gutschilla/elixir-map-deeply"
      }
     ]
  end

end
