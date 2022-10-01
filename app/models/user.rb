class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true

  has_many :posts, dependent: :destroy
end
