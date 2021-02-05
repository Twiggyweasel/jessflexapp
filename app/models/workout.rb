class Workout < ApplicationRecord
  has_many :workout_activities, dependent: :destroy
  has_many :activity_variations, through: :workout_activities
  has_many :activities, through: :activity_variations

  validates :title, presence: true, length: { in: 6..30 }
  validates :description, length: { in: 6..150 }
end
