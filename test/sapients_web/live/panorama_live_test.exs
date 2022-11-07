defmodule SapientsWeb.PanoramaLiveTest do
  use SapientsWeb.ConnCase

  import Phoenix.LiveViewTest
  import Sapients.MediaFixtures

  @create_attrs %{url: "some url"}
  @update_attrs %{url: "some updated url"}
  @invalid_attrs %{url: nil}

  defp create_panorama(_) do
    panorama = panorama_fixture()
    %{panorama: panorama}
  end

  describe "Index" do
    setup [:create_panorama]

    test "lists all panoramas", %{conn: conn, panorama: panorama} do
      {:ok, _index_live, html} = live(conn, Routes.panorama_index_path(conn, :index))

      assert html =~ "Listing Panoramas"
      assert html =~ panorama.url
    end

    test "saves new panorama", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.panorama_index_path(conn, :index))

      assert index_live |> element("a", "New Panorama") |> render_click() =~
               "New Panorama"

      assert_patch(index_live, Routes.panorama_index_path(conn, :new))

      assert index_live
             |> form("#panorama-form", panorama: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#panorama-form", panorama: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.panorama_index_path(conn, :index))

      assert html =~ "Panorama created successfully"
      assert html =~ "some url"
    end

    test "updates panorama in listing", %{conn: conn, panorama: panorama} do
      {:ok, index_live, _html} = live(conn, Routes.panorama_index_path(conn, :index))

      assert index_live |> element("#panorama-#{panorama.id} a", "Edit") |> render_click() =~
               "Edit Panorama"

      assert_patch(index_live, Routes.panorama_index_path(conn, :edit, panorama))

      assert index_live
             |> form("#panorama-form", panorama: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#panorama-form", panorama: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.panorama_index_path(conn, :index))

      assert html =~ "Panorama updated successfully"
      assert html =~ "some updated url"
    end

    test "deletes panorama in listing", %{conn: conn, panorama: panorama} do
      {:ok, index_live, _html} = live(conn, Routes.panorama_index_path(conn, :index))

      assert index_live |> element("#panorama-#{panorama.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#panorama-#{panorama.id}")
    end
  end

  describe "Show" do
    setup [:create_panorama]

    test "displays panorama", %{conn: conn, panorama: panorama} do
      {:ok, _show_live, html} = live(conn, Routes.panorama_show_path(conn, :show, panorama))

      assert html =~ "Show Panorama"
      assert html =~ panorama.url
    end

    test "updates panorama within modal", %{conn: conn, panorama: panorama} do
      {:ok, show_live, _html} = live(conn, Routes.panorama_show_path(conn, :show, panorama))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Panorama"

      assert_patch(show_live, Routes.panorama_show_path(conn, :edit, panorama))

      assert show_live
             |> form("#panorama-form", panorama: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#panorama-form", panorama: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.panorama_show_path(conn, :show, panorama))

      assert html =~ "Panorama updated successfully"
      assert html =~ "some updated url"
    end
  end
end
