class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness:true
  has_many :posts
  has_many :products through: :posts
end
