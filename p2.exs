defmodule P2 do
  def go(limit) do
    Stream.iterate([1, 2], fn [a, b] -> [b, a + b] end)
    |> Stream.take_while(fn [_, b] -> b <= limit end)
    |> Stream.filter(fn [_, b] -> rem(b, 2) == 0 end)
    |> Stream.map(fn [_, b] -> b end)    
    |> Enum.sum
    |> IO.inspect
  end
end
P2.go(4000000)