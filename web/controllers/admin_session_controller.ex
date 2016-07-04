defmodule HelloPhoenix.AdminSessionController do
  use HelloPhoenix.Web, :controller
  alias HelloPhoenix.Admin
  require Logger

  def new(conn, _params) do
    render conn, :new, [username: ""]
  end

  def create(conn, params) do
    Logger.warn "params: #{inspect params}"
    username = params["session"]["username"]
    password = params["session"]["password"]
    u = Repo.one(from u in Admin, where: u.username == ^username)
    Logger.warn "admin: #{inspect u}"
    if u != nil and Admin.checkpw(password, u.encrypted_password) do
      url = case get_session(conn, "admin_return_to") do
        nil -> "/"
        value -> value
      end
      conn
      |> PlugAuth.Authentication.Database.create_login(u, :name)
      |> put_flash(:notice, "Signed in successfully.")
      |> put_session("admin_return_to", nil)
      |> redirect(to: url)
    else
      render(conn, :new, [username: username])
    end
  end

  def destroy(conn, _params) do
    PlugAuth.Authentication.Database.delete_login(conn)
    |> redirect(to: admin_session_path(conn, :new))
  end

  def login_callback(conn) do
    conn
    |> put_layout({HelloPhoenix.LayoutView, "app.html"})
    |> put_view(HelloPhoenix.AdminSessionView)
    |> render("new.html", username: "")
    |> halt
  end
end
