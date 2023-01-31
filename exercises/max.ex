defmodule MaxMin do
  def max([]) do
    nil
  end
  def max([first | rest]) do
      pmax(rest, first)
  end

  defp pmax([], current) do
    current
  end
  defp pmax([first | rest], current) when first > current do
    pmax(rest, first)
  end
  defp pmax([_first | rest], current) do
    pmax(rest, current)
  end

  def min([]) do
    nil
  end
  def min([first | rest]) do
      pmin(rest, first)
  end

  defp pmin([], current) do
    current
  end
  defp pmin([first | rest], current) when first < current do
    pmin(rest, first)
  end
  defp pmin([_first | rest], current) do
    pmin(rest, current)
  end
end
