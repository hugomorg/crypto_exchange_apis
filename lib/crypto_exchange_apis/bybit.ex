defmodule CryptoExchangeAPIs.Bybit do
  @moduledoc """
  https://bybit-exchange.github.io/docs/
  """
  defmodule V5 do
    @moduledoc """
    https://bybit-exchange.github.io/docs/v5/intro
    """

    @doc """
    https://bybit-exchange.github.io/docs/v5/market/tickers
    """
    def get_tickers(opts \\ []) do
      Req.get("https://api.bybit.com/v5/market/tickers", opts)
    end

    @doc """
    https://bybit-exchange.github.io/docs/v5/market/history-fund-rate
    """
    def get_funding_rate_history(opts \\ []) do
      Req.get("https://api.bybit.com/v5/market/funding/history", opts)
    end

    @doc """
    https://bybit-exchange.github.io/docs/v5/position
    """
    def get_position_info(api_key, api_secret, opts \\ []) do
      Req.get(
        "https://api.bybit.com/v5/position/list",
        CryptoExchangeAPIs.Bybit.generate_signature(api_key, api_secret, opts)
      )
    end

    @doc """
    https://bybit-exchange.github.io/docs/api-explorer/v5/position/execution
    """
    def get_execution_list(api_key, api_secret, opts \\ []) do
      Req.get(
        "https://api.bybit.com/v5/execution/list",
        CryptoExchangeAPIs.Bybit.generate_signature(api_key, api_secret, opts)
      )
    end
  end

  def generate_signature(api_key, api_secret, opts) do
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
