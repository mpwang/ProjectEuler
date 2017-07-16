defmodule P56 do

  def solve do
    for a <- 2..99, b <- 2..99 do
      {a, b}
    end
    |> Stream.map(&a_pow_b(&1))
    |> Enum.max
  end

  defp a_pow_b({a, b}) do
    Arbitrary.pow(a, b)
    |> to_string
    |> String.codepoints
    |> Enum.map(fn digit -> String.to_integer(digit) end)
    |> Enum.sum
  end
end

defmodule Arbitrary do
  def pow(_, 0), do: 1
  def pow(b, e) when e > 0, do: pow(b, e, 1)

  defp pow(b, 1, acc), do: acc * b
  defp pow(b, p, acc) when rem(p, 2) == 0, do: pow(b * b, div(p, 2), acc)
  defp pow(b, p, acc), do: pow(b, p - 1, acc * b)
end

{time, solution} = :timer.tc(fn -> P56.solve() end)
IO.inspect("#{solution}, #{time / 1000}ms")
