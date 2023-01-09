defmodule Sapients.Nostr do
  @moduledoc """
  The Nostr context.
  """

  import Ecto.Query, warn: false
  alias Sapients.Repo

  alias Sapients.Nostr.NIP05

  @doc """
  Returns the list of names.

  ## Examples

      iex> list_names()
      [%NIP05{}, ...]

  """
  def list_names do
    Repo.all(NIP05)
  end

  @doc """
  Gets a single nip05.

  Raises `Ecto.NoResultsError` if the Nip05 does not exist.

  ## Examples

      iex> get_nip05!(123)
      %NIP05{}

      iex> get_nip05!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nip05!(id), do: Repo.get!(NIP05, id)

  # gets a single nip05 by "name"
  def get_nip05_by_name!(name), do: Repo.get_by!(NIP05, name: name)

  @doc """
  Creates a nip05.

  ## Examples

      iex> create_nip05(%{field: value})
      {:ok, %NIP05{}}

      iex> create_nip05(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nip05(attrs \\ %{}) do
    %NIP05{}
    |> NIP05.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nip05.

  ## Examples

      iex> update_nip05(nip05, %{field: new_value})
      {:ok, %NIP05{}}

      iex> update_nip05(nip05, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nip05(%NIP05{} = nip05, attrs) do
    nip05
    |> NIP05.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nip05.

  ## Examples

      iex> delete_nip05(nip05)
      {:ok, %NIP05{}}

      iex> delete_nip05(nip05)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nip05(%NIP05{} = nip05) do
    Repo.delete(nip05)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nip05 changes.

  ## Examples

      iex> change_nip05(nip05)
      %Ecto.Changeset{data: %NIP05{}}

  """
  def change_nip05(%NIP05{} = nip05, attrs \\ %{}) do
    NIP05.changeset(nip05, attrs)
  end
end
