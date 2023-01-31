defmodule MergeSort do

  def descending([]), do: []
  def descending([a]), do: [a]
  def descending(list) do
    half_size = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_size)
    merge(descending(list_a), descending(list_b))
  end

  defp merge(list_a, []) do
    list_a
  end
  defp merge([], list_b) do
    list_b
  end
  defp merge([first_a|rest_a], [first_b|rest_b]) when first_a >= first_b do
    [first_a | merge(rest_a, [first_b|rest_b])]
  end
  defp merge(list_a, [first_b|rest_b]) do
    [first_b | merge(list_a, rest_b)]
  end

end
