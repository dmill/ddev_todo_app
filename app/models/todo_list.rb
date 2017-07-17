class TodoList < ApplicationRecord
  has_many :todo_list_users
  has_many :users, through: :todo_list_users
  has_many :todo_items

  enum status: ["Incomplete", "In Progress", "Finished"]
end
