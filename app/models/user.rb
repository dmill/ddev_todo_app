class User < ApplicationRecord
  has_many :todo_list_users
  has_many :todo_lists, through: :todo_list_users
  has_many :todo_items

  enum user_type: ["student", "instructor", "ta"]

  validates_presence_of :email #:first_name, :last_name, :dob
  validates_associated :todo_items

  after_create :send_welcome_email

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  def todo_list_count
    self.todo_lists.count
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
