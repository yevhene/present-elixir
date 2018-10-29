defmodule Fib do
  def fib(n) when n > 40, do: raise "You will never get it"
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
end

IO.puts Fib.fib(41)
