defmodule CryptoExchangeAPIs.MixProject do
  use Mix.Project

  def project do
    [
      app: :crypto_exchange_apis,
      version: "0.1.5",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Crypto currency exchange APIs.",
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/hugomorg/crypto_exchange_apis"}
      ],
      source_url: "https://github.com/hugomorg/crypto_exchange_apis"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:req, "~> 0.4.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
