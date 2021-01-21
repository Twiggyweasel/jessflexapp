class ActivityBlock < ApplicationRecord
  belongs_to :activity

  validates :rep, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :set, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :weight, presence: true if -> { self.activity.has_weight }
end
