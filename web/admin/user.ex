defmodule HelloPhoenix.ExAdmin.User do
  use ExAdmin.Register

  register_resource HelloPhoenix.User do
    index do
      selectable_column

      column :id
      column :name
      actions       # display the default actions column
    end
  end
end
