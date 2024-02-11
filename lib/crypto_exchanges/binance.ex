defmodule CryptoExchanges.Binance do
  defmodule Futures do
    defmodule V1 do
      def exchange_info(opts \\ []) do
        Req.get("https://fapi.binance.com/fapi/v1/exchangeInfo", opts)
      end

      def mark_price(opts \\ []) do
        Req.get("https://fapi.binance.com/fapi/v1/premiumIndex", opts)
      end

      def funding_rate(opts \\ []) do
        Req.get("https://fapi.binance.com/fapi/v1/fundingRate", opts)
      end

      def income_history(api_key, api_secret, opts \\ []) do
        opts = CryptoExchanges.Binance.generate_signature(api_secret, opts)

        default_headers = [{"X-MBX-APIKEY", api_key}]

        opts =
          Keyword.update(
            opts,
            :headers,
            default_headers,
            &Keyword.merge(&1, default_headers)
          )

        Req.get("https://fapi.binance.com/fapi/v1/income", opts)
      end
    end

    defmodule V2 do
      def positions(api_key, api_secret, opts \\ []) do
        opts = CryptoExchanges.Binance.generate_signature(api_secret, opts)

        default_headers = [{"X-MBX-APIKEY", api_key}]

        opts =
          Keyword.update(
            opts,
            :headers,
            default_headers,
            &Keyword.merge(&1, default_headers)
          )

        Req.get("https://fapi.binance.com/fapi/v2/positionRisk", opts)
      end
    end
  end

  def generate_signature(api_secret, opts) do
    timestamp = DateTime.to_unix(DateTime.utc_now(), :millisecond)

    opts =
      Keyword.update(
        opts,
        :params,
        [timestamp: timestamp],
        &Keyword.put(&1, :timestamp, timestamp)
      )

    query_string = URI.encode_query(opts[:params])
    signature = hmac(api_secret, query_string)
    # It's required here that signature must be the last param
    Keyword.update(opts, :params, [signature: signature], &(&1 ++ [signature: signature]))
  end

  defp hmac(key, data) do
    :hmac
    |> :crypto.mac(:sha256, key, data)
    |> Base.encode16(case: :lower)
  end
end