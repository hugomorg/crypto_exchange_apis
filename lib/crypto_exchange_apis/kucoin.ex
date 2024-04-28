defmodule CryptoExchangeAPIs.Kucoin do
  @moduledoc """
  https://www.kucoin.com/docs/beginners/introduction
  """
  defmodule Futures do
    defmodule V1 do
      @doc """
      https://www.kucoin.com/docs/rest/futures-trading/funding-fees/get-current-funding-rate
      """
      def get_current_funding_rate(symbol, opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/funding-rate/#{symbol}/current", opts)
      end

      @doc """
      https://www.kucoin.com/docs/rest/futures-trading/funding-fees/get-public-funding-history
      """
      def get_past_funding_rates(opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/contract/funding-rates", opts)
      end

      @doc """
      https://www.kucoin.com/docs/rest/futures-trading/market-data/get-symbols-list
      """
      def get_symbols(opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/contracts/active", opts)
      end

      @doc """
      https://www.kucoin.com/docs/rest/futures-trading/market-data/get-current-mark-price
      """
      def get_current_mark_price(symbol, opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/mark-price/#{symbol}/current", opts)
      end
    end
  end
end
