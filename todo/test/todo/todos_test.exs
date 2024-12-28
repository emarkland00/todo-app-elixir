defmodule Todo.TodosTest do
  use Todo.DataCase

  alias Todo.Todos

  describe "todo_items" do
    alias Todo.Todos.TodoItem

    import Todo.TodosFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_todo_items/0 returns all todo_items" do
      todo_item = todo_item_fixture()
      assert Todos.list_todo_items() == [todo_item]
    end

    test "get_todo_item!/1 returns the todo_item with given id" do
      todo_item = todo_item_fixture()
      assert Todos.get_todo_item!(todo_item.id) == todo_item
    end

    test "create_todo_item/1 with valid data creates a todo_item" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %TodoItem{} = todo_item} = Todos.create_todo_item(valid_attrs)
      assert todo_item.description == "some description"
      assert todo_item.title == "some title"
    end

    test "create_todo_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo_item(@invalid_attrs)
    end

    test "update_todo_item/2 with valid data updates the todo_item" do
      todo_item = todo_item_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %TodoItem{} = todo_item} = Todos.update_todo_item(todo_item, update_attrs)
      assert todo_item.description == "some updated description"
      assert todo_item.title == "some updated title"
    end

    test "update_todo_item/2 with invalid data returns error changeset" do
      todo_item = todo_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo_item(todo_item, @invalid_attrs)
      assert todo_item == Todos.get_todo_item!(todo_item.id)
    end

    test "delete_todo_item/1 deletes the todo_item" do
      todo_item = todo_item_fixture()
      assert {:ok, %TodoItem{}} = Todos.delete_todo_item(todo_item)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo_item!(todo_item.id) end
    end

    test "change_todo_item/1 returns a todo_item changeset" do
      todo_item = todo_item_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo_item(todo_item)
    end
  end
end
