defmodule CryptoExchangeAPIs.Hyperliquid do
  @moduledoc """
  https://hyperliquid.gitbook.io/hyperliquid-docs
  """

  @doc """
  https://hyperliquid.gitbook.io/hyperliquid-docs/for-developers/api/info-endpoint/perpetuals#retrieve-perpetuals-metadata
  """
  def get_perpetuals_metadata do
    Req.post("https://api.hyperliquid.xyz/info", json: %{type: "meta"})
  end

  @doc """
  https://hyperliquid.gitbook.io/hyperliquid-docs/for-developers/api/info-endpoint/perpetuals#retrieve-perpetuals-asset-contexts-includes-mark-price-current-funding-open-interest-etc
  """
  def get_asset_contexts do
    Req.post("https://api.hyperliquid.xyz/info", json: %{type: "metaAndAssetCtxs"})
  end

  @doc """
  https://hyperliquid.gitbook.io/hyperliquid-docs/for-developers/api/info-endpoint/perpetuals#retrieve-historical-funding-rates
  """
  def get_historical_funding_rates(params) when is_list(params) do
    params |> Map.new() |> get_historical_funding_rates()
  end

  def get_historical_funding_rates(%{coin: coin, start_time: start_time}) do
    Req.post("https://api.hyperliquid.xyz/info",
      json: %{type: "fundingHistory", coin: coin, startTime: start_time}
    )
  end
end
