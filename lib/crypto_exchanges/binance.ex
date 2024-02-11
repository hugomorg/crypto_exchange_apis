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
    end
  end
end
