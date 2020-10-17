class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :rank, optional: true

  validates :user_id, {presence: true}
end
