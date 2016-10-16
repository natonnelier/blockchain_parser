defmodule BlockchainParser.Mixfile do
  use Mix.Project

  def project do
    [app: :blockchain_parser,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     deps: deps(),
     package: package]
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
  #   {:blockchain_parser, git: "https://github.com/natonnelier/blockchain_parser.git", tag: "0.0.1"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    "A Bitcoin blockchain parser written in elixir"
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Nicolas Tonnelier"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/natonnelier/blockchain_parser"}
    ]
  end
end
