defmodule QuickSort do

  def ascending([]), do: []
  def ascending([a]), do: [a]
  def ascending([pivot|rest]) do
    {list_a, list_b} = Enum.split_with(rest, fn x -> x < pivot end)
    Enum.concat(ascending(list_a),[pivot])
    |> Enum.concat(ascending(list_b))
  end
end
