class Training < ApplicationRecord
  belongs_to :users, optional: true
end
