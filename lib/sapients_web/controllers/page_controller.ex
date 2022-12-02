defmodule SapientsWeb.PageController do
  use SapientsWeb, :controller

  alias Sapients.Accounts
  alias Sapients.Media

  def index(conn, _params) do
    users = Accounts.list_users_for_index()
    links = Application.get_env(:sapients, :social_links)
    render(conn, "index.html", users: users, links: links)
  end

  def show(conn, %{"username" => username}) do
    user = Accounts.get_user_by_username(username)
    posts = Media.list_user_posts(user)
    links = Media.list_user_links(user)
    render(conn, "show.html", posts: posts, links: links, user: user)
  end

  def pick_palette(conn, _opts) do
    #  :teal, :navy, :maroon,:nothing, :desert, :brick, :sun, 
    colors = [:pure, :morning, :wine, :mountain, :fall, :ocean, :desert, :forest]
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
