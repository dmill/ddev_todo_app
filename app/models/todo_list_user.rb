class TodoListUser < ApplicationRecord
  self.table_name = "todo_lists_users"

  belongs_to :user
  belongs_to :todo_list
end
