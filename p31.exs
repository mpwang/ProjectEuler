defmodule P31 do
  def solve do
    changes(200, [1, 2, 5, 10, 20, 50, 100, 200])
  end
  def changes(0, _coins), do: 1
  def changes(_money, []), do: 0
  def changes(money, _coins) when money < 0, do: 0
  def changes(money, coins) do
    [head | tails] = coins
    changes(money, tails) + changes(money - head, coins)
  end
end
:timer.tc(fn -> P31.solve end) |> IO.inspect
