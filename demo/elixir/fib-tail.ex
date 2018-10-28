defmodule Fib do
  def fib(a), do: fib(1, 1, a)

  defp fib(a, _, 0 ), do: a
  defp fib(a, b, n), do: fib(b, a + b, n - 1)
end

IO.puts Fib.fib(80)
