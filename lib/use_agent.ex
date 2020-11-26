defmodule UseAgent do

    def value(key \\ :cursor) do
        Agente.value()
        |> Map.get(key)
    end

    def update(value, key) do
        Agente.update(value, key)
        {:ok, "value updated to #{value}"}
    end

    def new(key, value) do
        Agente.update(value, key)
        {:ok, "new value added"}
    end

    def change_state do
        IO.puts "===================="
        ["def456", "ghi789", "jkl101", "mno121", "pqr131", "stu141", "vwx151", "yza151"]
        |> Enum.map(&do_change/1)
    end

    defp do_change(value) do
       IO.puts "function: do_change/1"
       IO.puts "Valor antigo: #{Map.get(Agente.value(), :cursor)}"
       Agente.update(value)
       IO.puts "Novo valor: #{Map.get(Agente.value(), :cursor)}"
       Process.sleep(1000)
       IO.puts "===================="
    end
end

# UseAgent.change_state