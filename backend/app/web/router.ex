defmodule App.Router do
  use App.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end


  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug App.Web.Context
  end

  #  pipeline :api do
  #    plug :accepts, ["json"]
  #  end

  scope "/", App do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: App.Schema
  end



  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: App.Schema

    # Other scopes may use custom stacks.
    # scope "/api", App do
    #   pipe_through :api
    # end
end
