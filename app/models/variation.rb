# Varitation on activities allowing for custom sets, reps, weight etc
class Variation < ApplicationRecord
  belongs_to :activity

  enum difficulty: { beginner: 0, intermediate: 1, advanced: 2 }

  validates :rep, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :set, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  # validates :weight,numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 300 }
  validates :difficulty, presence: true, inclusion: { in: difficulties.keys }
end
