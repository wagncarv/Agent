# Agent
Implementation using ** Agent ** in `Elixir`.

![alt-text](elixir_logo2.jpg)

## Use
**Update value**:
```elixir
 iex> Agente.update("xxx001")
 :ok
```
**Show current status**:
```elixir
 iex> Agente.value()
 %{cursor: "xxx001"}

 iex> Agente.value(:cursor)
 %{cursor: "xxx001"}
```
**New key - value**:
```elixir
 iex> Agente.new(:index, "atualizacao")
 :ok
 iex> Agente.value()
%{cursor: :normal, index: "atualizacao"}
```

**Add a value**:
```elixir
 iex> Agente.increment
 :ok
 iex> Agente.value()
%{cursor: :normal, sum: 1}

iex> Agente.increment(5)
:ok
iex> Agente.value
%{cursor: :normal, sum: 5}
```

**Merge values**:
```elixir
 iex> map = %{nome: "John Doe", last_name: "Smith", skills: [1, 2, 6]}
 iex> Agente.merge(map)
 %{cursor: :normal, last_name: "Smith", nome: "John Doe", skills: [1, 2, 6]}
```

**Delete a value**:
```elixir
 %{cursor: "novo valor hh", nova: "outro valor"}
 iex> Agente.delete(:cursor)
 %{nova: "outro valor"}
```

**Delete too many values**:
```elixir
 %{foo: "foo bar", nova: "outro valor"}
 iex> Agente.drop([:foo, :nova])
 %{}
```

## Configuration
Add the configuration below to your application to start the ```Agent```:
```elixir
  def application do
    [
      extra_applications: [:logger],
      mod: {Agente, %{cursor: :normal}}
    ]
  end
```

## Installation

If [available in Hex] (https://hex.pm/docs/publish), the package can be installed
adding `agent` to your list of dependencies in` mix.exs`:

```elixir
def deps do
  [
    {:agente, "~> 0.1.2"}
  ]
end
```

Documentation can be generated with [ExDoc] (https://github.com/elixir-lang/ex_doc)
and published in [HexDocs] (https://hexdocs.pm). After publication, *** docs *** may
be found at [https://hexdocs.pm/agente).
