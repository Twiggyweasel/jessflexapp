# Varitation on activities allowing for custom sets, reps, weight etc
class Variation < ApplicationRecord
  belongs_to :activity
  has_many :workout_activities, dependent: :nullify

  validates :description, presence: true
end
