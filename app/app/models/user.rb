# == Schema Information
#
# Table name: devices
#
#  id                        :integer          not null, primary key
#  name                      :string           not null
#  email                     :integer          not null, uniqueness: true
#  password_digest           :string           not null, length:{minimum: 8} 
#  

class User < ApplicationRecord
  has_secure_password

  # belongs_to :trainings

  has_many :ranks
  has_many :training_logs
  has_many :training_index, through: :training_logs, source: :training
  has_many :favorites
  has_many :favorite_ranks, through: :favorites, source: :rank

  validates :name , {presence: true}
  validates :email, {uniqueness: true, presence: true}
  validates :password, {length: {minimum: 8}}
end
