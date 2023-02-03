defmodule Auction do
  import Ecto.Query
  alias Auction.{Item, Repo, User, Password, Bid}

  @repo Repo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get(Item, id)
  end

  def get_item_with_bids(id) do
    id
    |> get_item()
    |> @repo.preload(bids: [:user])
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

  def edit_item(id) do
    get_item(id)
    |> Item.changeset()
  end

  def get_user(id) do
    @repo.get(User, id)
  end

  def get_bids_for_user(user) do
    query =
      from bid in Bid,
      where: bid.user_id == ^user.id,
      order_by: [desc: :inserted_at],
      preload: :item,
      limit: 10
    @repo.all(query)
  end

  def new_user() do
    User.changeset_with_password(%User{})
  end

  def insert_user(user) do
    %User{}
    |> User.changeset_with_password(user)
    |> @repo.insert()
  end

  def get_user_by_username_and_password(username, password) do
    with user when not is_nil(user) <- @repo.get_by(User, %{username: username}),
      true <- Password.verify_with_hash(password, user.hashed_password) do
        user
      else
        _ -> Password.dummy_verify
    end
  end

  def insert_bid(bid) do
    %Bid{}
    |> Bid.changeset(bid)
    |> @repo.insert()
  end

  def new_bid(), do: Bid.changeset(%Bid{})
end
