class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { message: "This email is already registered. Login instead." }
  validates :password, presence: true
  validates :username, presence: true

  has_many :posts, dependent: :destroy
end
