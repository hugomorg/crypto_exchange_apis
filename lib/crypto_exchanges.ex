defmodule CryptoExchanges do
  @moduledoc """
  `CryptoExchanges` is intended to be a thin wrapper over some cryptocurrency exchange APIs.
  """

  @exchanges [
    CryptoExchanges.Binance,
    CryptoExchanges.Bybit,
    CryptoExchanges.Kucoin,
    CryptoExchanges.OKX
  ]
  def exchanges, do: @exchanges
end
