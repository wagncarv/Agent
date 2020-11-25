defmodule AgenteTest do
  use ExUnit.Case
  doctest Agente

  describe "Test return value" do
    value = "aaa333"
    Agente.update(value)
    assert Agente.value == %{cursor: value}
  end

  describe "Test value" do
    value = "aaa333"
    Agente.update(value)
    assert Agente.value == %{cursor: value}
  end

  describe "Test update" do
    returned_value = Agente.update("cccxxx")
    assert returned_value == :ok
  end
end
