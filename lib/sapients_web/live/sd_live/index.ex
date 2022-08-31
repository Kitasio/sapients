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
    <div class="container mx-auto mt-10">
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
        <button phx-click="generate" phx-disable-with="Generating..." phx-value-cover_id={cover.id}>Generate covers</button>
        <div class="mb-10 flex flex-col">
          <p class="subheading"><%= cover.title %></p>
          <p><%= cover.description %></p>
          <%= if cover.img_urls do %>
            <div class="columns-2 space-y-2 gap-2">
              <%= for url <- cover.img_urls do %>
                <img class="w-full" src={url} alt="">
              <% end %>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  def handle_event("generate", %{"cover_id" => cover_id}, socket) do
    book = AI.get_book_cover!(cover_id)
    img_urls = book.description |> gen_covers()

    case AI.update_book_cover(book, %{img_urls: img_urls}) do
      {:ok, _book} ->
        {:noreply,
         socket
         |> assign(book_covers: list_covers(socket.assigns.current_user))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
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

  def gen_covers(prompt) do
    prompt
    |> BookCoverGenerator.description_to_cover_idea(System.get_env("OAI_TOKEN"))
    |> BookCoverGenerator.diffuse(1, System.get_env("REPLICATE_TOKEN"))
  end
end
