defmodule Sapients.NostrFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sapients.Nostr` context.
  """

  @doc """
  Generate a nip05.
  """
  def nip05_fixture(attrs \\ %{}) do
    {:ok, nip05} =
      attrs
      |> Enum.into(%{
        name: "some name",
        pubkey: "some pubkey"
      })
      |> Sapients.Nostr.create_nip05()

    nip05
  end
end
