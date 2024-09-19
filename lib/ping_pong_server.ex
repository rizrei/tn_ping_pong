defmodule PingPongServer do
  @moduledoc """
  Echo server
  """

  use GenServer

  @spec start() :: {:ok, pid()} | {:error, atom()}
  def start(), do: GenServer.start(__MODULE__, nil)

  @spec ping(pid()) :: {:pong, node()} | {:error, atom()}
  def ping(pid), do: GenServer.call(pid, :ping)

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call(:ping, _from, state) do
    {:reply, {:pong, Node.self()}, state}
  end
end
