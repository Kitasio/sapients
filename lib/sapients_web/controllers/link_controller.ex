defmodule SapientsWeb.LinkController do
  use SapientsWeb, :controller

  alias Sapients.Media
  alias Sapients.Media.Link

  def action(conn, _) do
    args = [conn, conn.params, conn.assigns.current_user]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, _params, current_user) do
    links = Media.list_user_links(current_user)
    render(conn, "index.html", links: links)
  end

  def new(conn, _params, _current_user) do
    changeset = Media.change_link(%Link{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"link" => link_params}, current_user) do
    case Media.create_link(current_user, link_params) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link created successfully.")
        |> redirect(to: Routes.link_path(conn, :show, link))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, current_user) do
    link = Media.get_user_link!(current_user, id)
    render(conn, "show.html", link: link)
  end

  def edit(conn, %{"id" => id}, current_user) do
    link = Media.get_user_link!(current_user, id)
    changeset = Media.change_link(link)
    render(conn, "edit.html", link: link, changeset: changeset)
  end

  def update(conn, %{"id" => id, "link" => link_params}, current_user) do
    link = Media.get_user_link!(current_user, id)

    case Media.update_link(link, link_params) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link updated successfully.")
        |> redirect(to: Routes.link_path(conn, :show, link))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", link: link, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, current_user) do
    link = Media.get_user_link!(current_user, id)
    {:ok, _link} = Media.delete_link(link)

    conn
    |> put_flash(:info, "Link deleted successfully.")
    |> redirect(to: Routes.link_path(conn, :index))
  end
end
