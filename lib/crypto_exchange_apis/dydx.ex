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

    @doc """
    https://docs.dydx.exchange/api_integration-indexer/indexer_api#getassetpositions
    """
    def get_asset_positions(opts \\ []) do
      Req.get("https://indexer.dydx.trade/v4/assetPositions", opts)
    end

    @doc """
    https://docs.dydx.exchange/api_integration-indexer/indexer_api#listpositions
    """
    def list_positions(opts \\ []) do
      Req.get("https://indexer.dydx.trade/v4/perpetualPositions", opts)
    end

    @doc """
    https://docs.dydx.exchange/api_integration-indexer/indexer_api#getparentsubaccount
    """
    def get_parent_subaccount(address, parent_subaccount_number, opts \\ []) do
      Req.get(
        "https://indexer.dydx.trade/v4/addresses/#{address}/parentSubaccountNumber/#{parent_subaccount_number}",
        opts
      )
    end
  end
end
