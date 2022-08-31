defmodule Sapients.AIFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sapients.AI` context.
  """

  @doc """
  Generate a book_cover.
  """
  def book_cover_fixture(attrs \\ %{}) do
    {:ok, book_cover} =
      attrs
      |> Enum.into(%{
        author: "some author",
        description: "some description",
        img_urls: [],
        source_url: "some source_url",
        tags: [],
        title: "some title"
      })
      |> Sapients.AI.create_book_cover()

    book_cover
  end
end
