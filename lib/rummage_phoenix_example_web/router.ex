defmodule RummagePhoenixExampleWeb.Router do
  use RummagePhoenixExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RummagePhoenixExampleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/categories", CategoryController, only: [:index]
    resources "/products", ProductController, only: [:index]
  end
end