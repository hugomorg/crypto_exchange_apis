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

      @doc """
      https://www.kucoin.com/docs/rest/futures-trading/positions/get-position-list
      """
      def get_position_list(api_key, api_secret, passphrase, opts \\ []) do
        Req.get(
          "https://api-futures.kucoin.com/api/v1/positions",
          generate_signature(
            api_key,
            api_secret,
            passphrase,
            Keyword.merge(opts, method: "GET", path: "/api/v1/positions")
          )
        )
      end

      defp generate_signature(api_key, api_secret, passphrase, opts) do
        timestamp = DateTime.utc_now() |> DateTime.to_unix() |> Kernel.*(1000)
        {method, opts} = Keyword.pop!(opts, :method)
        {path, opts} = Keyword.pop!(opts, :path)

        query_string =
          case opts[:params] do
            nil -> ""
            params -> "?" <> URI.encode_query(params)
          end

        signature = hmac(api_secret, "#{timestamp}#{method}#{path}#{query_string}")

        headers = [
          {"KC-API-SIGN", signature},
          {"KC-API-KEY", api_key},
          {"KC-API-TIMESTAMP", timestamp},
          {"KC-API-PASSPHRASE", passphrase}
        ]

        Keyword.put(opts, :headers, headers)
      end

      defp hmac(key, data) do
        :hmac
        |> :crypto.mac(:sha256, key, data)
        |> Base.encode64(case: :lower)
      end
    end
  end
end
