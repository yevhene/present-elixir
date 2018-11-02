defmodule Metamath do
  defmacro calc({:+, _, args}) do
    Enum.at(args, 0) * 1 + Enum.at(args, 1) * 2
  end
end

defmodule Main do
  require Metamath

  def main do
    IO.puts Metamath.calc(2 + 3)
  end
end

Main.main
