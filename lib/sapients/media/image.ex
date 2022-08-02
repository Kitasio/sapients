defmodule Sapients.Media.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :image_url, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:image_url])
    |> validate_required([:image_url])
  end
end
