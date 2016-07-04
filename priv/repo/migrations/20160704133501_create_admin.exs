defmodule HelloPhoenix.Repo.Migrations.CreateAdmin do
  use Ecto.Migration

  def change do
    create table(:admin) do
      add :username, :string
      add :encrypted_password, :string

      timestamps()
    end

  end
end
