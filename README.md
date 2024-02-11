# CryptoExchangeAPIs

`CryptoExchangeAPIs` is intended to be a thin wrapper over some cryptocurrency exchange APIs.

Each function accepts an optional keyword list, where `params` and `headers` can be passed. For example:

```elixir
CryptoExchangeAPIs.Binance.Futures.V1.get_funding_rate(params: [symbol: "ETHUSDT"])
```

Each authenticated endpoint has arguments you need to pass to generate signed headers etc.

Here's an example with Bybit:

```elixir
CryptoExchangeAPIs.Bybit.V5.get_position_info(api_key, api_secret, params: [category: "linear", symbol: "ETHUSD"])
```

Each exchange has its own module, namespaced by API version and maybe API structure: for example, some APIs have separate resources for futures.

Under the hood, `CryptoExchangeAPIs` uses the excellent HTTP library [`req`](https://github.com/wojtekmach/req). All options unless otherwise noted are forwarded to `req`, so check out the docs there if you want more information.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `crypto_exchanges` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:crypto_exchange_apis, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/crypto_exchanges>.
