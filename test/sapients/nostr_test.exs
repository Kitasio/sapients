defmodule Sapients.NostrTest do
  use Sapients.DataCase

  alias Sapients.Nostr

  describe "names" do
    alias Sapients.Nostr.NIP05

    import Sapients.NostrFixtures

    @invalid_attrs %{name: nil, pubkey: nil}

    test "list_names/0 returns all names" do
      nip05 = nip05_fixture()
      assert Nostr.list_names() == [nip05]
    end

    test "get_nip05!/1 returns the nip05 with given id" do
      nip05 = nip05_fixture()
      assert Nostr.get_nip05!(nip05.id) == nip05
    end

    test "create_nip05/1 with valid data creates a nip05" do
      valid_attrs = %{name: "some name", pubkey: "some pubkey"}

      assert {:ok, %NIP05{} = nip05} = Nostr.create_nip05(valid_attrs)
      assert nip05.name == "some name"
      assert nip05.pubkey == "some pubkey"
    end

    test "create_nip05/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nostr.create_nip05(@invalid_attrs)
    end

    test "update_nip05/2 with valid data updates the nip05" do
      nip05 = nip05_fixture()
      update_attrs = %{name: "some updated name", pubkey: "some updated pubkey"}

      assert {:ok, %NIP05{} = nip05} = Nostr.update_nip05(nip05, update_attrs)
      assert nip05.name == "some updated name"
      assert nip05.pubkey == "some updated pubkey"
    end

    test "update_nip05/2 with invalid data returns error changeset" do
      nip05 = nip05_fixture()
      assert {:error, %Ecto.Changeset{}} = Nostr.update_nip05(nip05, @invalid_attrs)
      assert nip05 == Nostr.get_nip05!(nip05.id)
    end

    test "delete_nip05/1 deletes the nip05" do
      nip05 = nip05_fixture()
      assert {:ok, %NIP05{}} = Nostr.delete_nip05(nip05)
      assert_raise Ecto.NoResultsError, fn -> Nostr.get_nip05!(nip05.id) end
    end

    test "change_nip05/1 returns a nip05 changeset" do
      nip05 = nip05_fixture()
      assert %Ecto.Changeset{} = Nostr.change_nip05(nip05)
    end
  end
end
