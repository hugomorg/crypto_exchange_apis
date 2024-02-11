defmodule CryptoExchanges.Bybit do
  defmodule V5 do
    def tickers(opts \\ []) do
      Req.get("https://api.bybit.com/v5/market/tickers", opts)
    end

    def funding_rate_history(opts \\ []) do
      Req.get("https://api.bybit.com/v5/market/funding/history", opts)
    end

    def position_info(opts \\ []) do
      Req.get(
        "https://api.bybit.com/v5/position/list",
        CryptoExchanges.Bybit.generate_signature(opts)
      )
    end

    def trade_history(opts \\ []) do
      Req.get(
        "https://api.bybit.com/v5/execution/list",
        CryptoExchanges.Bybit.generate_signature(opts)
      )
    end
  end

  def generate_signature(opts) do
    {api_key, opts} = Keyword.pop(opts, :api_key)
    {api_secret, opts} = Keyword.pop(opts, :api_secret)

    timestamp = DateTime.to_unix(DateTime.utc_now(), :millisecond)

    query_string = URI.encode_query(opts[:params] || [])

    signature = hmac(api_secret, "#{timestamp}#{api_key}#{query_string}")

    headers = [
      {"X-BAPI-SIGN", signature},
      {"X-BAPI-API-KEY", api_key},
      {"X-BAPI-TIMESTAMP", timestamp}
    ]

    Keyword.put(opts, :headers, headers)
  end

  defp hmac(key, data) do
    :hmac
    |> :crypto.mac(:sha256, key, data)
    |> Base.encode16(case: :lower)
  end
end
