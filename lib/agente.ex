defmodule Agente do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  def start(initial_value, args) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def update(value) do
    Agent.update(__MODULE__, & Map.put(&1, :cursor, value))
  end
end
