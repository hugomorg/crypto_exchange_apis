defmodule CryptoExchangeAPIsTest do
  use ExUnit.Case
  doctest CryptoExchangeAPIs

  test "greets the world" do
    assert CryptoExchangeAPIs.hello() == :world
  end
end
