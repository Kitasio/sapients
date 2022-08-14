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

    <div class="grid grid-cols-4 mb-3 text-xl font-bold gap-5 place-content-center">
      <p>Email</p>
      <p>Username</p>
      <p>Is Visible?</p>
      <p>Order</p>
    </div>
    <%= for user <- @users do %>
        <div class="grid grid-cols-4 gap-5 place-content-center">
            <span><%= user.email %></span>
            <span><%= user.username %></span>
            <a href="#" phx-click="toggle_hide" phx-value-user_id={user.id}><%= is_hidden(user) %></a>
            <div class="flex gap-5">
              <a href="#" phx-click="order_down" phx-value-user_id={user.id}>-</a>
              <%= user.order %>
              <a href="#" phx-click="order_up" phx-value-user_id={user.id}>+</a>
            </div>
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

  def handle_event("order_up", %{"user_id" => user_id}, socket) do
    user = Accounts.get_user!(user_id)
    order_up(user)

    {
      :noreply,
      assign(
        socket,
        users: list_users()
      )
    }
  end

  def handle_event("order_down", %{"user_id" => user_id}, socket) do
    user = Accounts.get_user!(user_id)
    order_down(user)

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

  def order_up(user) do
    Accounts.update_user(user, %{order: user.order + 1})
  end

  def order_down(user) do
    Accounts.update_user(user, %{order: user.order - 1})
  end

  def is_hidden(user) do
    if user.hidden do
      "Hidden"
    else
      "Visible"
    end
  end
end
