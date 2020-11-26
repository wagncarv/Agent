defmodule Agente do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  def start(initial_value, args) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  def value(key \\ :cursor) do
    Agent.get(__MODULE__, & &1)
  end

  def update(value, key) do
    Agent.update(__MODULE__, & Map.put(&1, key, value))
  end

  def new(key, value) do
    Agent.update(__MODULE__, & Map.put_new(&1, key, value))
  end
end
