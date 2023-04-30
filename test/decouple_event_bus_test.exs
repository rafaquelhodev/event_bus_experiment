defmodule DecoupleEventBusTest do
  use ExUnit.Case
  doctest DecoupleEventBus

  test "greets the world" do
    assert DecoupleEventBus.hello() == :world
  end
end
