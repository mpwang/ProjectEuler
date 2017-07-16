defmodule P1 do
  def solve(num) do
    1..(num - 1)
    |> Enum.filter(fn x -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
    |> Enum.sum
    |> IO.inspect
  end
end
P1.solve(1000)
