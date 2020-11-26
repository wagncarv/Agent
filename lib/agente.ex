defmodule Agente do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  def start(initial_value, args) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  @doc """
    Retorna o(s) valor(es) atual(ais) armazenados.
  """
  def value(key \\ :cursor) do
    Agent.get(__MODULE__, & &1)
  end

  @doc """
    Insere o valor fornecido na chave no mapa.
  """
  def update(value, key) do
    Agent.update(__MODULE__, & Map.put(&1, key, value))
  end

  @doc """
    Insere o valor fornecido na chave, a menos que a chave de entrada já exista no mapa.
  """
  def new(key, value) do
    Agent.update(__MODULE__, & Map.put_new(&1, key, value))
  end

  @doc """
    Exclui a entrada no mapa para uma chave específica.
    Se a chave não existir, retorna o mapa inalterado.
  """
  def delete(key) do
    Agent.update(__MODULE__, & Map.delete(&1, key))
  end

  @doc """
    Exclui as chaves fornecidas do mapa.
    Se as chaves contêm chaves que não estão no mapa, elas são simplesmente ignoradas.
  """
  def drop(keys) do
    Agent.update(__MODULE__, & Map.drop(&1, keys))
  end
end
