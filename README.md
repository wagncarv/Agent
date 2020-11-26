# Agent
Exemplo de uso de **Agent** em `Elixir`.

![alt text](https://github.com/wagncarv/Agent/blob/main/elixir.jpg)

## Exemplos de Uso
**Atualizar valor:**
```elixir
iex> Agente.update("xxx001")
:ok
```
**Buscar valor atual:**
```elixir
iex> Agente.value()
%{cursor: "xxx001"}
```

## Configuração
Adicione a configuração abaixo à sua aplicação para incializar o ```Agent```:
```elixir
  def application do
    [
      extra_applications: [:logger],
      mod: {Agente, %{cursor: :normal}}
    ]
  end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `agente` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:agente, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/agente](https://hexdocs.pm/agente).
