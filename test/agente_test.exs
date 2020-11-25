defmodule AgenteTest do
  use ExUnit.Case
  doctest Agente

  test "greets the world" do
    assert Agente.hello() == :world
  end
end
