defmodule CryptoExchanges.Bybit do
  def tickers(opts \\ []) do
    Req.get("https://api.bybit.com/v5/market/tickers", opts)
  end
end
