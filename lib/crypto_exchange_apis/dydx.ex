defmodule CryptoExchangeAPIs.DYdX do
  defmodule V4 do
    @moduledoc """
    https://docs.dydx.exchange/api_integration-indexer/indexer_api
    """

    @doc """
    https://docs.dydx.exchange/api_integration-indexer/indexer_api#listperpetualmarkets
    """
    def list_perpetual_markets(opts \\ []) do
      Req.get("https://indexer.dydx.trade/v4/perpetualMarkets", opts)
    end

    @doc """
    https://docs.dydx.exchange/api_integration-indexer/indexer_api#gethistoricalfunding
    """
    def get_historical_funding(symbol, opts \\ []) do
      Req.get("https://indexer.dydx.trade/v4/historicalFunding/#{symbol}", opts)
    end
  end
end
