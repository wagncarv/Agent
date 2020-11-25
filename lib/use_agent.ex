defmodule UseAgent do
    import Agente

    def init do
        IO.puts "function: init/0"
        Agente.start_link("abc123")
    end

    def change_state do
        IO.puts "function: change_state/0"
        init()
        IO.puts "===================="
        ["def456", "ghi789", "jkl101", "mno121", "pqr131", "stu141", "vwx151", "yza151"]
        |> Enum.map(&do_change/1)
    end

    defp do_change(value) do
       IO.puts "function: do_change/1"
       IO.puts "Valor antigo: #{Map.get(Agente.value(), :cursor)}"
       Agente.update(value)
       IO.puts "Novo valor: #{Map.get(Agente.value(), :cursor)}"
       Process.sleep(2000)
       IO.puts "===================="
    end
end

# UseAgent.change_state