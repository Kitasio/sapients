defmodule SapientsWeb.PageView do
  use SapientsWeb, :view

  alias Sapients.Media

  def posts(user) do
    Media.list_user_posts(user)
  end

  def posts() do
    [
      %{image: "https://picsum.photos/id/512/1000/600"},
      %{image: "https://picsum.photos/id/513/1000/600"},
      %{image: "https://picsum.photos/id/514/1000/600"},
      %{image: "https://picsum.photos/id/515/1000/600"},
    ]
  end

  def first_post(posts) do
    [first | _] = posts
    first
  end

  def second_post(posts) do
    [_ | list] = posts
    [second | _] = list
    second
  end

  def rest_posts(posts) do
    [_ | list] = posts
    [_ | rest] = list
    rest
  end
end
