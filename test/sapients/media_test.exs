defmodule Sapients.MediaTest do
  use Sapients.DataCase

  alias Sapients.Media

  describe "posts" do
    alias Sapients.Media.Post

    import Sapients.MediaFixtures

    @invalid_attrs %{description: nil, image: nil, order: nil, title: nil, url: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Media.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Media.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{description: "some description", image: "some image", order: 42, title: "some title", url: "some url"}

      assert {:ok, %Post{} = post} = Media.create_post(valid_attrs)
      assert post.description == "some description"
      assert post.image == "some image"
      assert post.order == 42
      assert post.title == "some title"
      assert post.url == "some url"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{description: "some updated description", image: "some updated image", order: 43, title: "some updated title", url: "some updated url"}

      assert {:ok, %Post{} = post} = Media.update_post(post, update_attrs)
      assert post.description == "some updated description"
      assert post.image == "some updated image"
      assert post.order == 43
      assert post.title == "some updated title"
      assert post.url == "some updated url"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_post(post, @invalid_attrs)
      assert post == Media.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Media.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Media.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Media.change_post(post)
    end
  end

  describe "links" do
    alias Sapients.Media.Link

    import Sapients.MediaFixtures

    @invalid_attrs %{icon: nil, title: nil, url: nil}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Media.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Media.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{icon: "some icon", title: "some title", url: "some url"}

      assert {:ok, %Link{} = link} = Media.create_link(valid_attrs)
      assert link.icon == "some icon"
      assert link.title == "some title"
      assert link.url == "some url"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{icon: "some updated icon", title: "some updated title", url: "some updated url"}

      assert {:ok, %Link{} = link} = Media.update_link(link, update_attrs)
      assert link.icon == "some updated icon"
      assert link.title == "some updated title"
      assert link.url == "some updated url"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_link(link, @invalid_attrs)
      assert link == Media.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Media.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Media.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Media.change_link(link)
    end
  end

  describe "images" do
    alias Sapients.Media.Image

    import Sapients.MediaFixtures

    @invalid_attrs %{image_url: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Media.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Media.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{image_url: "some image_url"}

      assert {:ok, %Image{} = image} = Media.create_image(valid_attrs)
      assert image.image_url == "some image_url"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{image_url: "some updated image_url"}

      assert {:ok, %Image{} = image} = Media.update_image(image, update_attrs)
      assert image.image_url == "some updated image_url"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_image(image, @invalid_attrs)
      assert image == Media.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Media.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Media.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Media.change_image(image)
    end
  end
end
