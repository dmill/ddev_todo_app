class RemoveUserIdFromTodoLists < ActiveRecord::Migration[5.0]
  def change
    remove_reference :todo_lists, :user, index: true, foreign_key: true
  end
end
