class Training < ApplicationRecord
  belongs_to :users, optional: true
  has_many :training_logs
end
