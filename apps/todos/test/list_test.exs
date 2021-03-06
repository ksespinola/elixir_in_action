defmodule Todos.ListTest do
  use ExUnit.Case
  doctest Todos
  alias Todos.{List, Todo}

  describe ".new/0" do
    test "empty list struct" do
      assert List.new == %List{}
    end
  end

  describe ".add/2" do
    test "adds new todo to list" do
      assert List.add(
        List.new,
        %{
          date: {2017, 9, 10},
          note: "test"
        }
      ) == %List{
        auto_id: 2,
        entries: %{1 => Todo.new(%{id: 1, date: {2017, 9, 10}, note: "test"})}
      }
    end
  end

  describe ".from_list/1" do
    test "new todo list from list" do
      List.from_list(
        [%{date: "2017/9/10", note: "test"}]
      ) == %List{
        auto_id: 2,
        entries: %{1 => Todo.new(%{id: 1, date: {2017, 9, 10}, note: "test"})}
      }
    end
  end
end
