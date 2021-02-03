class Workout < ApplicationRecord
  has_many :workout_activities
  has_many :activity_variations, through: :workout_activities
  has_many :activities, through: :activity_variations

  validates :title, presence: true
end
