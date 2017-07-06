class TodoItem < ApplicationRecord
  belongs_to :user
  belongs_to :asignee, class_name: "User"
  belongs_to :todo_list

  validates_presence_of :summary
end
