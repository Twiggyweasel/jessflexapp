class Workout < ApplicationRecord
  WORKOUT_STATUSES = %i[active inactive].freeze

  has_many :workout_activities, dependent: :destroy
  has_many :activity_variations, through: :workout_activities
  has_many :activities, through: :activity_variations

  enum status: WORKOUT_STATUSES

  validates :title, presence: true, length: { in: 6..30 }
  validates :description, length: { in: 6..150 }
  validates :status, presence: true, inclusion: { in: Workout.statuses.keys }
  validates :bundle_only, inclusion: { in: [true, false] }
end
