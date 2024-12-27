defmodule TodoWeb.HelloController do
  use TodoWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger}) do
    #render(conn, :show, messenger: messenger)
    #text(conn, "From messenger #{messenger}")
    #json(conn, %{id: messenger})
    conn
    |> Plug.Conn.assign(:messenger, messenger)
    |> render(:show)
  end
end
