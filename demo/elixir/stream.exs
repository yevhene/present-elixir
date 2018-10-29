0
|> Stream.iterate(&(&1 + 1))
|> Stream.filter(fn x -> rem(x, 2) == 0 end)
|> Stream.take(10)
|> Enum.map(&IO.puts/1)
