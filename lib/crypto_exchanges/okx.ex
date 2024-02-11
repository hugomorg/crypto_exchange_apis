defmodule CryptoExchanges.OKX do
  defmodule V5 do
    def get_funding_rate(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/funding-rate", opts)
    end

    def get_funding_rate_history(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/funding-rate-history", opts)
    end

    def get_underlying(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/underlying", opts)
    end

    def get_mark_price(opts \\ []) do
      Req.get("https://www.okx.com/api/v5/public/mark-price", opts)
    end
  end
end
