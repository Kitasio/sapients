defmodule SapientsWeb.NIP05Controller do
  use SapientsWeb, :controller

  alias Sapients.Nostr
  alias Sapients.Nostr.NIP05

  def index(conn, _params) do
    names = Nostr.list_names()
    render(conn, "index.html", names: names)
  end

  def new(conn, _params) do
    changeset = Nostr.change_nip05(%NIP05{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"nip05" => nip05_params}) do
    case Nostr.create_nip05(nip05_params) do
      {:ok, nip05} ->
        conn
        |> put_flash(:info, "Nip05 created successfully.")
        |> redirect(to: Routes.nip05_path(conn, :show, nip05))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    nip05 = Nostr.get_nip05!(id)
    render(conn, "show.html", nip05: nip05)
  end

  def edit(conn, %{"id" => id}) do
    nip05 = Nostr.get_nip05!(id)
    changeset = Nostr.change_nip05(nip05)
    render(conn, "edit.html", nip05: nip05, changeset: changeset)
  end

  def update(conn, %{"id" => id, "nip05" => nip05_params}) do
    nip05 = Nostr.get_nip05!(id)

    case Nostr.update_nip05(nip05, nip05_params) do
      {:ok, nip05} ->
        conn
        |> put_flash(:info, "Nip05 updated successfully.")
        |> redirect(to: Routes.nip05_path(conn, :show, nip05))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", nip05: nip05, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    nip05 = Nostr.get_nip05!(id)
    {:ok, _nip05} = Nostr.delete_nip05(nip05)

    conn
    |> put_flash(:info, "Nip05 deleted successfully.")
    |> redirect(to: Routes.nip05_path(conn, :index))
  end
end
