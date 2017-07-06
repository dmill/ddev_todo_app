class User < ApplicationRecord
  has_and_belongs_to_many :todo_lists
  has_many :todo_items
end
