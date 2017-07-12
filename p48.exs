defmodule P48 do
  def go(num) do
    modulo = :math.pow(10, 10) |> round
    pow = fn n ->
      Stream.iterate(n, fn x -> rem(x * n, modulo) end)
      |> Enum.take(n)
      |> List.last
    end
    
    1..num
    |> Stream.map(fn n -> pow.(n) end)
    |> Enum.reduce(0, fn(sum, acc) -> rem(sum + acc, modulo) end)
    |> IO.inspect
  end
end

P48.go(1000)