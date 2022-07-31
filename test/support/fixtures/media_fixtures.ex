defmodule Sapients.MediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sapients.Media` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        order: 42,
        title: "some title",
        url: "some url"
      })
      |> Sapients.Media.create_post()

    post
  end

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        title: "some title",
        url: "some url"
      })
      |> Sapients.Media.create_link()

    link
  end
end
