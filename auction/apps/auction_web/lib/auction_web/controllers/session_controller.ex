defmodule AuctionWeb.SessionController do
  use AuctionWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    case Auction.get_user_by_username_and_password(username, password) do
      %Auction.User{} = user ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Welcome back #{username}!")
        |> redirect(to: Routes.item_path(conn, :index))
      _ ->
        conn
        |> put_flash(:error, "Wrong credentials")
        |> render("new.html")
    end
  end
end