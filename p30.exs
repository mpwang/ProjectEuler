defmodule P30 do
  def solve(limit) do
    2..(:math.pow(10, limit + 1) - 1 |> round)
    |> Enum.filter(fn n ->
      n 
      |> Integer.digits 
      |> Enum.map(fn digit -> round(:math.pow(digit, limit)) end)
      |> Enum.sum
      |> Kernel.==(n)
    end)
    |> Enum.sum
    |> IO.inspect
  end
end
P30.solve(5)