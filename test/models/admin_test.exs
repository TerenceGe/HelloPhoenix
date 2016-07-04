defmodule HelloPhoenix.AdminTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Admin

  @valid_attrs %{encrypted_password: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Admin.changeset(%Admin{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Admin.changeset(%Admin{}, @invalid_attrs)
    refute changeset.valid?
  end
end
