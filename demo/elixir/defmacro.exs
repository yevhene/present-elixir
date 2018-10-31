defmodule My do
  defmacro if(clause, do: then, else: not_then) do
    quote do
      cond do
        unquote(clause) -> unquote(then)
        true -> unquote(not_then)
      end
    end
  end
end

defmodule Main do
  require My

  def main do
    My.if System.get_env("TRUE") do
      IO.puts "Hello"
    else
      IO.puts "World"
    end
  end
end

Main.main
