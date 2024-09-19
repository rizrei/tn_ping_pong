defmodule TnPingPongTest do
  use ExUnit.Case
  doctest TnPingPong

  test "greets the world" do
    assert TnPingPong.hello() == :world
  end
end
