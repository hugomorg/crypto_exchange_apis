defmodule CryptoExchanges.Kucoin do
  defmodule Futures do
    defmodule V1 do
      def get_current_funding_rate(symbol, opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/funding-rate/#{symbol}/current", opts)
      end

      def get_symbols(opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/contracts/active", opts)
      end

      def get_current_mark_price(symbol, opts \\ []) do
        Req.get("https://api-futures.kucoin.com/api/v1/mark-price/#{symbol}/current", opts)
      end
    end
  end
end
