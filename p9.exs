defmodule P9 do
  def go do
    for a <- 1..round(1000 / 3),
        b <- a..round((1000 - a) / 2),
        c <- b..1000,
      a + b + c == 1000, into: [] do
      [a, b, c]
    end
    |> Enum.filter(fn [a, b, c] ->
      :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
    end)
    |> List.first
    |> Enum.reduce(&*/2)
    |> IO.inspect
  end
end
P9.go