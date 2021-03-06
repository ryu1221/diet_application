# == Schema Information
#
# Table name: devices
#
#  id             :integer          not null, primary key
#  rank           :integer
#  itemName       :string
#  itemPrice      :integer
#  reviewAverage  :decimal
#  mediumImageUrls:string
#  itemCaption    :text
#  itemUrl      :string 
#  genre      :string 
# 

class Rank < ApplicationRecord
  belongs_to :users, optional: true
  has_many :favorites

  GENRES = {
    ranks: 100984,
    food: 111903,
    drink: 204673,
    sweets: 204655,
    suporters: 204675,
    equipments: 204674,
    others: 101885
  }
end
