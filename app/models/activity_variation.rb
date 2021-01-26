# Varitation on activities allowing for custom sets, reps, weight etc

class ActivityVariation < ApplicationRecord
  belongs_to :activity

  enum difficulty: [:beginner, :intermediate, :advanced]

  validates :rep, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :set, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :weight, presence: true if -> { self.activity.has_weight }
  validates :difficulty, presence: true, inclusion: { in: difficulties.keys }

end
