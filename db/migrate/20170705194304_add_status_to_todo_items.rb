class AddStatusToTodoItems < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_items, :status, :integer, default: 0
  end
end
