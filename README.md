# Agent
Implementação uso de **Agent** em `Elixir`.

![alt-text](elixir_logo2.jpg)

## Exemplos de Uso
**Atualizar valor**:
```elixir
 iex> Agente.update("xxx001")
 :ok
```
**Exibir estado atual**:
```elixir
 iex> Agente.value()
 %{cursor: "xxx001"}

 iex> Agente.value(:cursor)
 %{cursor: "xxx001"}
```
**Nova chave - valor**:
```elixir
 iex> Agente.new(:index, "atualizacao")
 :ok
 iex> Agente.value()
%{cursor: :normal, index: "atualizacao"}
```

**Incrementar um valor**:
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

**Mesclar valores**:
```elixir
 iex> map = %{nome: "John Doe", last_name: "Smith", skills: [1, 2, 6]}
 iex> Agente.merge(map)
 %{cursor: :normal, last_name: "Smith", nome: "John Doe", skills: [1, 2, 6]}
```

**Excluir um valor**:
```elixir
 %{cursor: "novo valor hh", nova: "outro valor"}
 iex> Agente.delete(:cursor)
 %{nova: "outro valor"}
```

**Excluir muitos valores**:
```elixir
 %{foo: "foo bar", nova: "outro valor"}
 iex> Agente.drop([:foo, :nova])
 %{}
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

## Instalação

Se [disponível em Hex](https://hex.pm/docs/publish), o pacote poderá ser instalado
adicionando-se `agente` à sua lista de dependências em `mix.exs`:

```elixir
def deps do
  [
    {:agente, "~> 0.1.2"}
  ]
end
```

A documentação pode ser gerada com [ExDoc](https://github.com/elixir-lang/ex_doc)
e publicada em [HexDocs](https://hexdocs.pm). Após publicação, o ***docs*** poderá
ser encontrado em [https://hexdocs.pm/agente](https://hexdocs.pm/agente).
