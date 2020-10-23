# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  user_id      :integer            not null
#  rank_id      :integer
#  created_at
#  updated_at

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :rank, optional: true

  validates :user_id, {presence: true}
end
