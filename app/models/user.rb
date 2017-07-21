class User < ApplicationRecord
  has_many :todo_list_users
  has_many :todo_lists, through: :todo_list_users
  has_many :todo_items

  enum user_type: ["student", "instructor", "ta"]

  validates_presence_of :email #:first_name, :last_name, :dob
  # validates_associated :todo_items

  # validates :user_type, inclusion: { in: TYPES.keys,
    # message: "%{value} is an invalid user type" }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  after_create :send_welcome_email

  def todo_list_count
    self.todo_lists.count
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
