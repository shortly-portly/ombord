defmodule Ombord.PacksTest do
  use Ombord.DataCase

  alias Ombord.Packs

  describe "packs" do
    alias Ombord.Packs.Pack

    @valid_attrs %{first_name: "some first_name"}
    @update_attrs %{first_name: "some updated first_name"}
    @invalid_attrs %{first_name: nil}

    def pack_fixture(attrs \\ %{}) do
      {:ok, pack} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Packs.create_pack()

      pack
    end

    test "list_packs/0 returns all packs" do
      pack = pack_fixture()
      assert Packs.list_packs() == [pack]
    end

    test "get_pack!/1 returns the pack with given id" do
      pack = pack_fixture()
      assert Packs.get_pack!(pack.id) == pack
    end

    test "create_pack/1 with valid data creates a pack" do
      assert {:ok, %Pack{} = pack} = Packs.create_pack(@valid_attrs)
      assert pack.first_name == "some first_name"
    end

    test "create_pack/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Packs.create_pack(@invalid_attrs)
    end

    test "update_pack/2 with valid data updates the pack" do
      pack = pack_fixture()
      assert {:ok, %Pack{} = pack} = Packs.update_pack(pack, @update_attrs)
      assert pack.first_name == "some updated first_name"
    end

    test "update_pack/2 with invalid data returns error changeset" do
      pack = pack_fixture()
      assert {:error, %Ecto.Changeset{}} = Packs.update_pack(pack, @invalid_attrs)
      assert pack == Packs.get_pack!(pack.id)
    end

    test "delete_pack/1 deletes the pack" do
      pack = pack_fixture()
      assert {:ok, %Pack{}} = Packs.delete_pack(pack)
      assert_raise Ecto.NoResultsError, fn -> Packs.get_pack!(pack.id) end
    end

    test "change_pack/1 returns a pack changeset" do
      pack = pack_fixture()
      assert %Ecto.Changeset{} = Packs.change_pack(pack)
    end
  end
end
