class User < ApplicationRecord
  has_and_belongs_to_many :todo_lists
  has_many :todo_items
  TYPES = {0 => "student", 1 => "instructor", 2 => "ta"}

  validates_presence_of :email, :first_name, :last_name, :dob
  validates :email, length: { minimum: 6 }, uniqueness: true
  validates_associated :todo_items
  validates :email, exclusion: { in: ["me@example.com", "you@example.com"],
    message: "%{value} is reserved." }

  validates :user_type, inclusion: { in: TYPES.keys,
    message: "%{value} is an invalid user type" }

  def todo_list_count
    self.todo_lists.count
  end
end
