defmodule Agente do
  use Agent

  @moduledoc """
    Implementation of state manipulative functions using the Agent module.
  """

  @doc """
    Start application.
  """
  def start_link(initial_value) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  @doc """
    Returns the current stored value(s).
  ## Example:
    ```
    Agente.value(:cursor)
    ```
  """
  def value(key \\ :cursor) do
    Agent.get(__MODULE__, & &1)
  end

  @doc """
   Inserts the value provided in the key on map.
  ## Example:
  ```
   Agente.update(:cursor, "cccxxx")
  ```
  """
  def update(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  @doc """   
    Inserts the value provided in the key, unless the input key already exists on the map.
  ## Example:
    ```
     Agente.new(:new, "cccxxx")
    ```
  """
  def new(key, value) do
    Agent.update(__MODULE__, &Map.put_new(&1, key, value))
  end

  @doc """
    Merges two maps into one.
    All keys in map2 will be added to map1, replacing any existing keys
    (that is, the keys in map2 "take precedence" over those in map1).

  ## Example:
  ```
   Agente.merge(%{cursor: "cccxxx"})
  ```
  """
  def merge(value) when is_map(value) do
    Agent.update(__MODULE__, &Map.merge(&1, value))
  end

  @doc """
    Deletes the entry on the map for a specific key.
    If the key does not exist, it returns the map unchanged.
  ## Example:
    ```
     Agente.delete(:cursor)
    ```
  """
  def delete(key) do
    Agent.update(__MODULE__, &Map.delete(&1, key))
  end

  @doc """
    Deletes the supplied keys from the map.
    If the keys contain keys that are not on the map, they are simply ignored.
  ## Example:
    ```
     Agente.drop([:foo, :bar])
    ```
  """
  def drop(keys) do
    Agent.update(__MODULE__, &Map.drop(&1, keys))
  end

  @doc """
    Increments a value to the current total. If the increment value is not passed,
    the default value is 1.
  ## Example:
    ```
     Agente.increment
     Agente.increment(2.)
    ```
  """
  def increment(number \\ 1) do
    value = Agent.get(__MODULE__, & &1)
    case Map.has_key?(value, :sum) do
      false -> Agent.update(__MODULE__, &Map.put_new(&1, :sum, number))
      true -> Agent.update(__MODULE__, &Map.put(&1, :sum, value.sum + number))
    end
    Agent.get(__MODULE__, & &1)
    |> Map.get(:sum)
  end
end
