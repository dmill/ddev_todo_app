class User < ApplicationRecord
  has_many :todo_list_users
  has_many :todo_lists, through: :todo_list_users
  has_many :todo_items

  enum user_type: ["student", "instructor", "ta"]

  validates_presence_of :email #:first_name, :last_name, :dob
  validates_associated :todo_items

  # validates :user_type, inclusion: { in: TYPES.keys,
    # message: "%{value} is an invalid user type" }

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  def todo_list_count
    self.todo_lists.count
  end
end
