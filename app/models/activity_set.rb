class ActivitySet < ApplicationRecord
  has_many :activity_blocks
  has_many :activities through: :activity_blocks
end
