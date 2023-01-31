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

  @enchanter_name "Edwin"
  def enchant_for_sale(item) do
    %{
      title: "#{@enchanter_name}'s #{item.title}",
      price: item.price * 3,
      magic: true
    }
  end

  def enchant_items(items) do
    Enum.map(items, &enchant_for_sale/1)
  end

  def test_data do [
    %{title: "Longsword", price: 50, magic: false}, %{title: "Healing Potion", price: 60, magic: true}, %{title: "Rope", price: 10, magic: false},
    %{title: "Dragon's Spear", price: 100, magic: true},
    ]
  end
end
