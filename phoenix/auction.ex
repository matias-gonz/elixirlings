defmodule Auction.Item do
  defstruct [:id, :title, :description, :ends_at]
end

defmodule Auction do
  alias Auction.{Item, FakeRepo}

  @repo FakeRepo

  def list_item do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end
end
