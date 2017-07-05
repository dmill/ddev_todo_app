class AddAssignerAndAssigneeReferencesToTodoItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :todo_items, :user, foreign_key: true
    add_column :todo_items, :asignee_id, :integer
  end
end
