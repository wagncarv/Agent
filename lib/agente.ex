defmodule Agente do
  use Agent

  @moduledoc """
    Implementação de funções manipuladoras de estado utilizando o módulo Agent.
  """

  @doc """
    Iniciar aplicação.
  """
  def start_link(initial_value) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  @doc """
    Iniciar aplicação.
  """
  def start(initial_value, args) do
    Agent.start_link(fn -> %{cursor: initial_value} end, name: __MODULE__)
  end

  @doc """
    Retorna o(s) valor(es) atual(ais) armazenados.
  ## Exemplo:
    ```
    Agente.value(:cursor)
    ```
  """
  def value(key \\ :cursor) do
    Agent.get(__MODULE__, & &1)
  end

  @doc """
    Insere o valor fornecido na chave no mapa.
  ## Exemplo:
  ```
   Agente.update(:cursor, "cccxxx")
  ```
  """
  def update(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  @doc """
    Insere o valor fornecido na chave, a menos que a chave de entrada já exista no mapa.
  ## Exemplo:
    ```
     Agente.new(:new, "cccxxx")
    ```
  """
  def new(key, value) do
    Agent.update(__MODULE__, &Map.put_new(&1, key, value))
  end

  @doc """
    Mescla dois mapas em um.
    Todas as chaves em map2 serão adicionadas a map1, substituindo qualquer uma existente
    (ou seja, as chaves em map2 "têm precedência" sobre as de map1).

  ## Exemplo:
  ```
   Agente.merge(%{cursor: "cccxxx"})
  ```
  """
  def merge(value) when is_map(value) do
    Agent.update(__MODULE__, &Map.merge(&1, value))
  end

  @doc """
    Exclui a entrada no mapa para uma chave específica.
    Se a chave não existir, retorna o mapa inalterado.
  ## Exemplo:
    ```
     Agente.delete(:cursor)
    ```
  """
  def delete(key) do
    Agent.update(__MODULE__, &Map.delete(&1, key))
  end

  @doc """
    Exclui as chaves fornecidas do mapa.
    Se as chaves contêm chaves que não estão no mapa, elas são simplesmente ignoradas.
  ## Exemplo:
    ```
     Agente.drop([:foo, :bar])
    ```
  """
  def drop(keys) do
    Agent.update(__MODULE__, &Map.drop(&1, keys))
  end

  @doc """
    Incrementa um valor ao total atual. Caso não seja passado o valor de incremento,
    o valor padrão é 1.
  ## Exemplo:
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
