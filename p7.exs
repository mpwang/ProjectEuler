defmodule P7 do  
  def findPrime(limit), do: go(limit, 3, [2], 1)
  
  defp go(limit, _, primes, len) when len >= limit, do: IO.puts(List.last(primes))
  defp go(limit, n, primes, len) do
    n_is_prime? =
      primes
      |> Enum.take(len |> :math.sqrt |> round)
      |> Enum.all?(fn x -> rem(n, x) != 0 end)
    if n_is_prime? do
      go(limit, n + 2, primes ++ [n], len + 1)
    else
      go(limit, n + 2, primes, len)
    end
  end
end

P7.findPrime(10001)