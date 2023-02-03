defmodule Auction do
  alias Auction.{Item, Repo}

  @repo Repo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end

  def insert_item(item) do
    %Item{}
    |> Item.changeset(item)
    |> @repo.insert()
  end

  def delete_item(%Item{} = item), do: @repo.delete(item)

  def update_item(%Item{} = item, updates) do
    item
    |> Item.changeset(updates)
    |> @repo.update()
  end

  def new_item(), do: Item.changeset(%Item{})
end
