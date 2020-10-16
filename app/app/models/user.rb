class User < ApplicationRecord
  has_secure_password
  
  has_many :ranks

  validates :name , {presence: true}
  validates :email, {uniqueness: true, presence: true}
  validates :password, {length: {minimum: 8}}
end
