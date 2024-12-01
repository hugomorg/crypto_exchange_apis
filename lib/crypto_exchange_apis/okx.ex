defmodule CryptoExchangeAPIs.OKX do
  defmodule V5 do
    @moduledoc """
    https://www.okx.com/docs-v5/en/
    """

    @doc """
    https://www.okx.com/docs-v5/en/#public-data-rest-api-get-funding-rate
    """
    def get_funding_rate(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/funding-rate", opts)
    end

    @doc """
    https://www.okx.com/docs-v5/en/#public-data-rest-api-get-funding-rate-history
    """
    def get_funding_rate_history(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/funding-rate-history", opts)
    end

    @doc """
    https://www.okx.com/docs-v5/en/#public-data-rest-api-get-underlying
    """
    def get_underlying(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/underlying", opts)
    end

    @doc """
    https://www.okx.com/docs-v5/en/#public-data-rest-api-get-mark-price
    """
    def get_mark_price(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/mark-price", opts)
    end

    @doc """
    https://www.okx.com/docs-v5/en/#trading-account-rest-api-get-positions
    """
    def get_position_info(api_key, api_secret, passphrase, opts \\ []) do
      Req.get(
        "https://www.okx.com/api/v5/account/positions",
        generate_signature(
          api_key,
          api_secret,
          passphrase,
          Keyword.merge(opts, method: "GET", path: "/api/v5/account/positions")
        )
      )
    end

    defp generate_signature(api_key, api_secret, passphrase, opts) do
      timestamp = DateTime.utc_now() |> DateTime.truncate(:millisecond) |> DateTime.to_iso8601()
      {method, opts} = Keyword.pop!(opts, :method)
      {path, opts} = Keyword.pop!(opts, :path)

      query_string =
        case opts[:params] do
          nil -> ""
          params -> "?" <> URI.encode_query(params)
        end

      signature = hmac(api_secret, "#{timestamp}#{method}#{path}#{query_string}")

      headers = [
        {"OK-ACCESS-SIGN", signature},
        {"OK-ACCESS-KEY", api_key},
        {"OK-ACCESS-TIMESTAMP", timestamp},
        {"OK-ACCESS-PASSPHRASE", passphrase}
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
