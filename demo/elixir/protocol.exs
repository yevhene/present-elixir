defmodule User do
  defstruct name: "John", age: 27
end

defimpl String.Chars, for: User do
  def to_string(%User{name: name}), do: name
end

defmodule Main do
  def main do
    user = %User{}
    IO.puts user
  end
end

Main.main
