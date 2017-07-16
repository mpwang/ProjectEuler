defmodule P16 do
  def solve(limit) do
    :math.pow(2, limit)
    |> round
    |> Integer.digits
    |> Enum.sum
    |> IO.inspect
  end
end
P16.solve(1000)