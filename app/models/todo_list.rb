class TodoList < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :todo_items

  enum status: ["Incomplete", "In Progress", "Finished"]
end
