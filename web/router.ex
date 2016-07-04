defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PlugAuth.Authentication.Database, db_model: HelloPhoenix.Admin, login: &HelloPhoenix.AdminSessionController.login_callback/1
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :public do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end

  scope "/", HelloPhoenix do
    pipe_through :public

    get "/sign_in", AdminSessionController, :new
    post "/sign_in", AdminSessionController, :create
    patch "/sign_out", AdminSessionController, :destroy
    delete "/sign_out", AdminSessionController, :destroy
  end

  # Other scopes may use custom stacks.
  scope "/api", HelloPhoenix do
    pipe_through :api
  end
end
