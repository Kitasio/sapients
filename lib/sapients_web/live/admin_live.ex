defmodule SapientsWeb.AdminLive do
  use SapientsWeb, :live_view

  alias Sapients.Accounts

  def mount(_params, session, socket) do
    {
      :ok,
      socket
      |> assign(
        current_user: Accounts.get_user_by_session_token(session["user_token"]),
        title: "Admin page live",
        users: list_users()
      )
    }
  end

  def render(assigns) do
    ~H"""
    <h1><%= @title %></h1>

    <span class="mt-5 flex link">
        <%= link "Tokens", to: Routes.token_path(@socket, :index) %>
    </span>

    <h2>Users</h2>

    <%= for user <- @users do %>
        <div>
            <span><%= user.username %> | <%= user.email %></span>
            <a href="#" phx-click="toggle_hide" phx-value-user_id={user.id}><%= is_hidden(user) %></a>
        </div>
    <% end %>
    """
  end

  def handle_event("toggle_hide", %{"user_id" => user_id}, socket) do
    user = Accounts.get_user!(user_id)
    toggle_hide(user)

    {
      :noreply,
      assign(
        socket,
        users: list_users()
      )
    }
  end

  def list_users() do
    Accounts.list_regular_users()
  end

  def toggle_hide(user) do
    if user.hidden do
      Accounts.update_user(user, %{hidden: false})
    else
      Accounts.update_user(user, %{hidden: true})
    end
  end

  def is_hidden(user) do
    if user.hidden do
      "Hidden"
    else
      "Visible"
    end
  end
end
