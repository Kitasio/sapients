defmodule SapientsWeb.AdminController do
  use SapientsWeb, :controller
  
  alias Sapients.Accounts

  def index(conn, _) do
    users = Accounts.list_users_for_index()
    conn
    |> render("index.html", users: users)
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.admin_path(conn, :index))
  end
end
