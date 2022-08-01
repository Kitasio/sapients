defmodule SapientsWeb.PageController do
  use SapientsWeb, :controller

  alias Sapients.Accounts
  alias Sapients.Media

  def index(conn, _params) do
    users = Accounts.list_users_for_index()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    posts = Media.list_user_posts(user)
    render(conn, "show.html", posts: posts)
  end
end
