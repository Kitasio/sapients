defmodule SapientsWeb.PostController do
  use SapientsWeb, :controller

  alias Sapients.Media
  alias Sapients.Media.Post

  def action(conn, _) do
    args = [conn, conn.params, conn.assigns.current_user]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, _params, current_user) do
    posts = Media.list_user_posts(current_user)
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params, _current_user) do
    changeset = Media.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}, current_user) do
    case Media.create_post(current_user, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, current_user) do
    post = Media.get_user_post!(current_user, id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}, current_user) do
    post = Media.get_user_post!(current_user, id)
    changeset = Media.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}, current_user) do
    post = Media.get_user_post!(current_user, id)

    case Media.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, current_user) do
    post = Media.get_user_post!(current_user, id)
    {:ok, _post} = Media.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
