defmodule SapientsWeb.PageView do
  use SapientsWeb, :view

  alias Sapients.Media

  def posts(user) do
    Media.list_user_posts_limited(user, 4)
  end

  def number_of_posts(user) do
    Media.user_posts_amount(user)
  end

  def links(user) do
    Media.list_user_links(user)
  end

  def hostname_of(link) do
    uri = link |> URI.parse()
    %URI{host: host} = uri
    host |> String.split(".") |> List.first()
  end

  defp choose_width(size) do
    case size do
      1 ->
        "tr:w-640"
      2 ->
        "tr:w-1024"
      3 ->
        "tr:w-1536"
      _ ->
        "tr:w-1024"
    end
  end

  defp choose_width_index(order) do
    case order do
      1 ->
        "tr:w-1536"
      _ ->
        "tr:w-640"
    end
  end

  def insert_image_tr(link, size) do
    uri = link |> URI.parse()
    %URI{host: host, path: path} = uri

    {filename, list} = path |> String.split("/") |> List.pop_at(-1)
    bucket = list |> List.last()
    transformation = choose_width(size)

    case host do
      "ik.imagekit.io" ->
        Path.join(["https://", host, bucket, transformation, filename])

      _ ->
        link
    end
  end

  def insert_image_tr_index(link, order) do
    uri = link |> URI.parse()
    %URI{host: host, path: path} = uri

    {filename, list} = path |> String.split("/") |> List.pop_at(-1)
    bucket = list |> List.last()
    transformation = choose_width_index(order)

    case host do
      "ik.imagekit.io" ->
        Path.join(["https://", host, bucket, transformation, filename])

      _ ->
        link
    end
  end
end
