defmodule Typecheckerapp do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Typecheckerapp.Supervisor.start_link
  end

  def receive_and_check(), do: {:error, "No data"}

  def receive_and_check(variable) do
    {:ok, received_var} = receive_variable(variable)
    received_var |> check_variable
  end

  defp receive_variable(variable) do
    {:ok, variable}
  end

  defp receive_variable() do
    {:error, "No data"}
  end

  defp check_variable(variable) when is_integer(variable), do: {:ok, "You give us an integer"}
  defp check_variable(variable) when is_float(variable),   do: {:ok, "You give us a float"}
  defp check_variable(variable) when is_tuple(variable),   do: {:ok, "You give us a tuple"}
  defp check_variable(variable) when is_list(variable),    do: {:ok, "You give us a list"}
  defp check_variable(variable) when is_atom(variable),    do: {:ok, "You give us an atom"}
end
