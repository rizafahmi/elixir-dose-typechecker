defmodule Typecheckerapp do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Typecheckerapp.Supervisor.start_link
  end

  def receive_variable(variable) do
    {:ok, variable}
  end

  def receive_variable() do
    {:error, "No data"}
  end

  def check_variable(variable) do
    cond do
      is_integer(variable) == true -> {:ok, "You give us an integer"}
      is_float(variable) == true -> {:ok, "You give us a float"}
      is_tuple(variable) == true -> {:ok, "You give us a tuple"}
      is_list(variable) == true -> {:ok, "You give us a list"}
      is_atom(variable) == true -> {:ok, "You give us an atom"}
    end
  end
end
