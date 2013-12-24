defmodule TypecheckerappTest do
  use ExUnit.Case

  test "receive any data type" do
    assert Typecheckerapp.receive_variable(25) == {:ok, 25}
    assert Typecheckerapp.receive_variable([1, 2, 3]) == {:ok, [1, 2, 3]}
    assert Typecheckerapp.receive_variable([]) == {:ok, []}
    assert Typecheckerapp.receive_variable({1, 2, 3}) == {:ok, {1, 2, 3}}
    assert Typecheckerapp.receive_variable(:data) == {:ok, :data}
  end
  test "did not receive any data" do
    assert Typecheckerapp.receive_variable == {:error, "No data"}
  end
  test "check variable is integer" do
    {:ok, variable} = Typecheckerapp.receive_variable(25)
    assert Typecheckerapp.check_variable(variable) == {:ok, "You give us an integer"}
  end
  test "check variable is float" do
    {:ok, variable} = Typecheckerapp.receive_variable(25.12)
    assert Typecheckerapp.check_variable(variable) == {:ok, "You give us a float"}
  end
  test "check variable is tuple" do
    {:ok, variable} = Typecheckerapp.receive_variable({})
    assert Typecheckerapp.check_variable(variable) == {:ok, "You give us a tuple"}
  end

  test "check variable is list" do
    {:ok, variable} = Typecheckerapp.receive_variable([1, 2])
    assert Typecheckerapp.check_variable(variable) == {:ok, "You give us a list"}
  end

  test "check variable is an atom" do
    {:ok, variable} = Typecheckerapp.receive_variable(:some_atom)
    assert Typecheckerapp.check_variable(variable) == {:ok, "You give us an atom"}
  end

  test "check blank variable" do
    {:error, "No data"} = Typecheckerapp.receive_variable
  end
end
