defmodule Fibonacci do
  def up_to_recursive(n) do
    up_to_recursive(0, 1, n, [])
  end

  defp up_to_recursive(a, b, n, list) when a+b <= n do
    up_to_recursive(b, a+b, n, [a + b | list])
  end
  defp up_to_recursive(_, _, _, list) do
    Enum.reverse(list)
  end

  def up_to(n) do
    Stream.iterate({0,1}, fn {a, b} -> {b, a+b} end)
    |> Enum.reduce_while([], fn {_a, b}, acc ->
      if b <= n, do: {:cont, [b|acc]}, else: {:halt, Enum.reverse(acc)}
    end)
  end
end
