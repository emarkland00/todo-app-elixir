defmodule TodoWeb.TodoItemJSON do
  alias Todo.Todos.TodoItem

  @doc """
  Renders a list of todo_items.
  """
  def index(%{todo_items: todo_items}) do
    %{data: for(todo_item <- todo_items, do: data(todo_item))}
  end

  @doc """
  Renders a single todo_item.
  """
  def show(%{todo_item: todo_item}) do
    %{data: data(todo_item)}
  end

  defp data(%TodoItem{} = todo_item) do
    %{
      id: todo_item.id,
      title: todo_item.title,
      description: todo_item.description
    }
  end
end
