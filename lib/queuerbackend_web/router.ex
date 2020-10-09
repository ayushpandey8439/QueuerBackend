defmodule QueuerbackendWeb.Router do
  use QueuerbackendWeb, :router

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

#  scope "/", QueuerbackendWeb do
#    pipe_through :browser

#    get "/", PageController, :index
#  end
scope "/api", QueuerbackendWeb do
  pipe_through :api

  resources "/queues", QueueController

end
  # Other scopes may use custom stacks.
  # scope "/api", QueuerbackendWeb do
  #   pipe_through :api
  # end
end
