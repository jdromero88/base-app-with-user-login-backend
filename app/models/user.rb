class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  validates :email, uniqueness:true
  has_many :posts
  has_many :products, through: :posts
end
