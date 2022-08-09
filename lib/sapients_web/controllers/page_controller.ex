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
    links = Media.list_user_links(user)
    render(conn, "show.html", posts: posts, links: links, user: user)
  end

  def pick_palette(conn, _opts) do
    colors = [:nothing, :brick, :sun, :aqua]
    session = Plug.Conn.get_session(conn)

    unless session |> Map.has_key?("palette") do
      selected_palette = colors |> Enum.random()

      conn
      |> put_session(:palette, selected_palette)
      |> assign(:palette, selected_palette)
    else
      %{"palette" => prev_color} = Plug.Conn.get_session(conn)

      colors = List.delete(colors, prev_color)
      selected_palette = colors |> Enum.random()

      conn
      |> put_session(:palette, selected_palette)
      |> assign(:palette, selected_palette)
    end
  end
end
