defmodule TodoWeb.TodoItemController do
  use TodoWeb, :controller

  alias Todo.Todos
  alias Todo.Todos.TodoItem

  action_fallback TodoWeb.FallbackController

  def index(conn, _params) do
    todo_items = Todos.list_todo_items()
    render(conn, :index, todo_items: todo_items)
  end

  def create(conn, %{"todo_item" => todo_item_params}) do
    with {:ok, %TodoItem{} = todo_item} <- Todos.create_todo_item(todo_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/todo_items/#{todo_item}")
      |> render(:show, todo_item: todo_item)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_item = Todos.get_todo_item!(id)
    render(conn, :show, todo_item: todo_item)
  end

  def update(conn, %{"id" => id, "todo_item" => todo_item_params}) do
    todo_item = Todos.get_todo_item!(id)

    with {:ok, %TodoItem{} = todo_item} <- Todos.update_todo_item(todo_item, todo_item_params) do
      render(conn, :show, todo_item: todo_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_item = Todos.get_todo_item!(id)

    with {:ok, %TodoItem{}} <- Todos.delete_todo_item(todo_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
