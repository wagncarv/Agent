# Agent

Exemplo uso de **Agent** em `Elixir`.

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
