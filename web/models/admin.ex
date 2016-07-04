defmodule HelloPhoenix.Admin do
  use HelloPhoenix.Web, :model

  schema "admin" do
    field :username, :string
    field :encrypted_password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :encrypted_password])
    |> validate_required([:username, :encrypted_password])
  end

  def checkpw(password, encrypted) do
    try do
      Comeonin.Bcrypt.checkpw(password, encrypted)
    rescue
      _ -> false
    end
  end

  def encrypt_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
