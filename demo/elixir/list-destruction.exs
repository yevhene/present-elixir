defmodule Collection do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
end

IO.puts Collection.len([1, 2, 3])

