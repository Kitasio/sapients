defmodule Sapients.AI do
  @moduledoc """
  The AI context.
  """

  import Ecto.Query, warn: false
  alias Sapients.Repo

  alias Sapients.AI.BookCover
  alias Sapients.Accounts

  @doc """
  Returns the list of book_covers.

  ## Examples

      iex> list_book_covers()
      [%BookCover{}, ...]

  """
  def list_book_covers do
    Repo.all(BookCover)
  end

  @doc """
  Gets a single book_cover.

  Raises `Ecto.NoResultsError` if the Book cover does not exist.

  ## Examples

      iex> get_book_cover!(123)
      %BookCover{}

      iex> get_book_cover!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_cover!(id), do: Repo.get!(BookCover, id)

  @doc """
  Creates a book_cover.

  ## Examples

      iex> create_book_cover(%{field: value})
      {:ok, %BookCover{}}

      iex> create_book_cover(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_cover(%Accounts.User{} = user, attrs \\ %{}) do
    %BookCover{}
    |> BookCover.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  def list_user_covers(%Accounts.User{} = user) do
    BookCover
    |> user_covers_query(user)
    |> order_by_date_insert()
    |> Repo.all()
  end

  def list_user_covers_limited(%Accounts.User{} = user, amount) do
    BookCover
    |> user_covers_query(user)
    |> limit_covers_query(amount)
    |> Repo.all()
  end

  def user_covers_amount(%Accounts.User{} = user) do
    BookCover
    |> user_covers_query(user)
    |> Repo.aggregate(:count)
  end

  def get_user_cover!(%Accounts.User{} = user, id) do
    BookCover
    |> user_covers_query(user)
    |> Repo.get!(id)
  end

  defp order_by_date_insert(query) do
    from(p in query, order_by: [desc: :inserted_at])
  end

  defp limit_covers_query(query, amount) do
    from(p in query, limit: ^amount)
  end

  defp user_covers_query(query, %Accounts.User{id: user_id}) do
    from(p in query, where: p.user_id == ^user_id)
  end

  @doc """
  Updates a book_cover.

  ## Examples

      iex> update_book_cover(book_cover, %{field: new_value})
      {:ok, %BookCover{}}

      iex> update_book_cover(book_cover, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_cover(%BookCover{} = book_cover, attrs) do
    book_cover
    |> BookCover.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_cover.

  ## Examples

      iex> delete_book_cover(book_cover)
      {:ok, %BookCover{}}

      iex> delete_book_cover(book_cover)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_cover(%BookCover{} = book_cover) do
    Repo.delete(book_cover)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_cover changes.

  ## Examples

      iex> change_book_cover(book_cover)
      %Ecto.Changeset{data: %BookCover{}}

  """
  def change_book_cover(%BookCover{} = book_cover, attrs \\ %{}) do
    BookCover.changeset(book_cover, attrs)
  end
end
