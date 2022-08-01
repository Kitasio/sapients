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
end
