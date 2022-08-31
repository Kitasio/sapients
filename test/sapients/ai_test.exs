defmodule Sapients.AITest do
  use Sapients.DataCase

  alias Sapients.AI

  describe "book_covers" do
    alias Sapients.AI.BookCover

    import Sapients.AIFixtures

    @invalid_attrs %{author: nil, description: nil, img_urls: nil, source_url: nil, tags: nil, title: nil}

    test "list_book_covers/0 returns all book_covers" do
      book_cover = book_cover_fixture()
      assert AI.list_book_covers() == [book_cover]
    end

    test "get_book_cover!/1 returns the book_cover with given id" do
      book_cover = book_cover_fixture()
      assert AI.get_book_cover!(book_cover.id) == book_cover
    end

    test "create_book_cover/1 with valid data creates a book_cover" do
      valid_attrs = %{author: "some author", description: "some description", img_urls: [], source_url: "some source_url", tags: [], title: "some title"}

      assert {:ok, %BookCover{} = book_cover} = AI.create_book_cover(valid_attrs)
      assert book_cover.author == "some author"
      assert book_cover.description == "some description"
      assert book_cover.img_urls == []
      assert book_cover.source_url == "some source_url"
      assert book_cover.tags == []
      assert book_cover.title == "some title"
    end

    test "create_book_cover/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AI.create_book_cover(@invalid_attrs)
    end

    test "update_book_cover/2 with valid data updates the book_cover" do
      book_cover = book_cover_fixture()
      update_attrs = %{author: "some updated author", description: "some updated description", img_urls: [], source_url: "some updated source_url", tags: [], title: "some updated title"}

      assert {:ok, %BookCover{} = book_cover} = AI.update_book_cover(book_cover, update_attrs)
      assert book_cover.author == "some updated author"
      assert book_cover.description == "some updated description"
      assert book_cover.img_urls == []
      assert book_cover.source_url == "some updated source_url"
      assert book_cover.tags == []
      assert book_cover.title == "some updated title"
    end

    test "update_book_cover/2 with invalid data returns error changeset" do
      book_cover = book_cover_fixture()
      assert {:error, %Ecto.Changeset{}} = AI.update_book_cover(book_cover, @invalid_attrs)
      assert book_cover == AI.get_book_cover!(book_cover.id)
    end

    test "delete_book_cover/1 deletes the book_cover" do
      book_cover = book_cover_fixture()
      assert {:ok, %BookCover{}} = AI.delete_book_cover(book_cover)
      assert_raise Ecto.NoResultsError, fn -> AI.get_book_cover!(book_cover.id) end
    end

    test "change_book_cover/1 returns a book_cover changeset" do
      book_cover = book_cover_fixture()
      assert %Ecto.Changeset{} = AI.change_book_cover(book_cover)
    end
  end
end
