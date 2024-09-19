defmodule PingPongServerTest do
  use ExUnit.Case
  doctest PingPongServer

  test "with one node" do
    node = Node.self()

    {:ok, ping_pong_server_pid} = PingPongServer.start()

    assert {:pong, ^node} = PingPongServer.ping(ping_pong_server_pid)
  end

  test "with two nodes" do
    {:ok, _} = Node.start(:master, :shortnames)

    {:ok, _, node} = :peer.start_link()
    :erpc.call(node, :code, :add_paths, [:code.get_path()])

    {:ok, ping_pong_server_pid} = :erpc.call(node, PingPongServer, :start, [])

    assert {:pong, ^node} = PingPongServer.ping(ping_pong_server_pid)
  end
end
