defmodule P25 do
  def solve(limit) do
    Stream.iterate([0, 1], fn [a, b] -> [b, a + b] end)
    |> Stream.take_while(fn [a, _] -> length(Integer.digits(a)) < limit end)
    |> Stream.map(fn [_, b] -> b end)
    |> Stream.with_index(1)
    |> Enum.to_list
    |> List.last
    |> IO.inspect
  end
end
P25.solve(1000)