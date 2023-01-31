defmodule GeneralStore do

  def filter_items(list, magic: magic_state) do
    filter_items(list, magic_state, [])
  end

  defp filter_items([], _, filtered) do
    filtered
  end
  defp filter_items([%{title: title, price: price, magic: magic_state}|rest], magic_state, filtered) do
    filter_items(rest, magic_state, [%{title: title, price: price, magic: magic_state}|filtered])
  end
  defp filter_items([_item|rest], magic_state, filtered) do
    filter_items(rest, magic_state, filtered)
  end

  def test_data do [
    %{title: "Longsword", price: 50, magic: false}, %{title: "Healing Potion", price: 60, magic: true}, %{title: "Rope", price: 10, magic: false},
    %{title: "Dragon's Spear", price: 100, magic: true},
    ]
    end
end
