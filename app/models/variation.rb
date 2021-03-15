# Varitation on activities allowing for custom sets, reps, weight etc
class Variation < ApplicationRecord
  belongs_to :exercise
  has_many :workout_exercises, dependent: :nullify

  validates :description, presence: true
end
