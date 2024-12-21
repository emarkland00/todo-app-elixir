defmodule TodoWeb.DefaultController do
  use TodoWeb, :controller

  def index(conn, _params) do
    json conn, %{
      title: "Todo List API - #{Mix.env()}",
      todos: [
        %{id: 1, title: "Learn Elixir", completed: false},
        %{id: 2, title: "Build a Phoenix app", completed: false},
        %{id: 3, title: "Ship it!", completed: false}
      ]
    }
    #json conn, "Todo List API - #{Mix.env()}"
  end
end
