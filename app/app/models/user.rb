class User < ApplicationRecord
  has_secure_password

  has_many :ranks
  has_many :favorites
  has_many :favorite_ranks, through: :favorites, source: :rank

  validates :name , {presence: true}
  validates :email, {uniqueness: true, presence: true}
  validates :password, {length: {minimum: 8}}
end
