defmodule CryptoExchangeAPIs do
  @moduledoc """
  `CryptoExchangeAPIs` is intended to be a thin wrapper over some cryptocurrency exchange APIs.
  """

  @exchanges [
    CryptoExchangeAPIs.Binance,
    CryptoExchangeAPIs.Bybit,
    CryptoExchangeAPIs.Kucoin,
    CryptoExchangeAPIs.OKX
  ]
  def exchanges, do: @exchanges
end
