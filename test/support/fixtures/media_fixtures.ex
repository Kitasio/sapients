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

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        image_url: "some image_url"
      })
      |> Sapients.Media.create_image()

    image
  end

  @doc """
  Generate a panorama.
  """
  def panorama_fixture(attrs \\ %{}) do
    {:ok, panorama} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> Sapients.Media.create_panorama()

    panorama
  end
end
