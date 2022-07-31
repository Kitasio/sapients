defmodule SapientsWeb.ProfileController do
  use SapientsWeb, :controller

  alias Sapients.Media

  def action(conn, _) do
    args = [conn, conn.params, conn.assigns.current_user]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, _params, current_user) do
    links = Media.list_user_links(current_user)
    posts = Media.list_user_posts(current_user)
    render(conn, "index.html", links: links, posts: posts)
  end
end
