defmodule CryptoExchanges.OKX do
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
  end
end
