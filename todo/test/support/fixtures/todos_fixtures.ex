defmodule Todo.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Todos` context.
  """

  @doc """
  Generate a todo_item.
  """
  def todo_item_fixture(attrs \\ %{}) do
    {:ok, todo_item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Todo.Todos.create_todo_item()

    todo_item
  end
end
