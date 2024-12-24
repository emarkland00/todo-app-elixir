defmodule Todo.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    create table(:todo_items) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
