defmodule TypecheckerappTest do
  use ExUnit.Case

  # Encore Part
  test "testing receive and check is integer" do
    assert Typecheckerapp.receive_and_check(12) == {:ok, "You give us an integer"}
  end

  test "testing receive and check is float" do
    assert Typecheckerapp.receive_and_check(1.2) == {:ok, "You give us a float"}
  end

  test "testing receive and check is tuple" do
    assert Typecheckerapp.receive_and_check({}) == {:ok, "You give us a tuple"}
  end

  test "testing receive and check is list" do
    assert Typecheckerapp.receive_and_check([1,2]) == {:ok, "You give us a list"}
  end

  test "testing receive and check is atom" do
    assert Typecheckerapp.receive_and_check(:one_little_atom) == {:ok, "You give us an atom"}
  end

  test "testing receive and check is blank" do
    assert Typecheckerapp.receive_and_check() == {:error, "No data"}
  end

end
