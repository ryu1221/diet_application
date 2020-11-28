class TrainingLog < ApplicationRecord
  belongs_to :user
  belongs_to :training, optional: true

  validates :user_id, {presence: true}
end
