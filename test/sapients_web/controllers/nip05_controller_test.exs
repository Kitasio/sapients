defmodule SapientsWeb.NIP05ControllerTest do
  use SapientsWeb.ConnCase

  import Sapients.NostrFixtures

  @create_attrs %{name: "some name", pubkey: "some pubkey"}
  @update_attrs %{name: "some updated name", pubkey: "some updated pubkey"}
  @invalid_attrs %{name: nil, pubkey: nil}

  describe "index" do
    test "lists all names", %{conn: conn} do
      conn = get(conn, Routes.nip05_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Names"
    end
  end

  describe "new nip05" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.nip05_path(conn, :new))
      assert html_response(conn, 200) =~ "New Nip05"
    end
  end

  describe "create nip05" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.nip05_path(conn, :create), nip05: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.nip05_path(conn, :show, id)

      conn = get(conn, Routes.nip05_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Nip05"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.nip05_path(conn, :create), nip05: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Nip05"
    end
  end

  describe "edit nip05" do
    setup [:create_nip05]

    test "renders form for editing chosen nip05", %{conn: conn, nip05: nip05} do
      conn = get(conn, Routes.nip05_path(conn, :edit, nip05))
      assert html_response(conn, 200) =~ "Edit Nip05"
    end
  end

  describe "update nip05" do
    setup [:create_nip05]

    test "redirects when data is valid", %{conn: conn, nip05: nip05} do
      conn = put(conn, Routes.nip05_path(conn, :update, nip05), nip05: @update_attrs)
      assert redirected_to(conn) == Routes.nip05_path(conn, :show, nip05)

      conn = get(conn, Routes.nip05_path(conn, :show, nip05))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, nip05: nip05} do
      conn = put(conn, Routes.nip05_path(conn, :update, nip05), nip05: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Nip05"
    end
  end

  describe "delete nip05" do
    setup [:create_nip05]

    test "deletes chosen nip05", %{conn: conn, nip05: nip05} do
      conn = delete(conn, Routes.nip05_path(conn, :delete, nip05))
      assert redirected_to(conn) == Routes.nip05_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.nip05_path(conn, :show, nip05))
      end
    end
  end

  defp create_nip05(_) do
    nip05 = nip05_fixture()
    %{nip05: nip05}
  end
end
