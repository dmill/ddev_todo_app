class User < ApplicationRecord
  has_many :todo_lists
  has_many :todo_items
end
