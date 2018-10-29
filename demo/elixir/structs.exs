defmodule User do
  defstruct name: "John", age: 27
end

defmodule Main do
  def main do
    user = %User{age: 27, name: "John"}

    %{age: x} = user

    IO.puts x
  end
end

Main.main

