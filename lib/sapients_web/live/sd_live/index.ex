defmodule SapientsWeb.SdLive.Index do
  use SapientsWeb, :live_view

  alias Sapients.Accounts
  alias Sapients.AI

  def mount(_params, session, socket) do
    {
      :ok,
      socket
      |> assign(
        changeset: AI.change_book_cover(%AI.BookCover{}),
        current_user: Accounts.get_user_by_session_token(session["user_token"]),
        title: "Stable Diffusion page",
        book_covers: list_covers(Accounts.get_user_by_session_token(session["user_token"]))
      )
    }
  end

  def render(assigns) do
    ~H"""
    <h1><%= @title %></h1>

    <.form let={f} for={@changeset} phx-change="validate" phx-submit="save">
      <%= label f, :title %>
      <%= text_input f, :title %>
      <%= error_tag f, :title %>

      <%= label f, :description %>
      <%= textarea f, :description %>
      <%= error_tag f, :description %>

      <%= submit "Save" %>
    </.form>

    <%= for cover <- @book_covers do %>
      <div class="flex flex-col">
        <p><%= cover.title %></p>
        <p><%= cover.description %></p>
      </div>
    <% end %>
    """
  end

  def handle_event("validate", %{"book_cover" => params}, socket) do
    changeset =
      %AI.BookCover{}
      |> AI.change_book_cover(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"book_cover" => cover_params}, socket) do
    case AI.create_book_cover(socket.assigns.current_user, cover_params) do
      {:ok, _book} ->
        {:noreply,
         socket
         |> put_flash(:info, "book cover created")}
         |> assign(book_covers: list_covers(socket.assigns.current_user))

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def list_covers(user) do
    AI.list_user_covers(user)
  end
end
