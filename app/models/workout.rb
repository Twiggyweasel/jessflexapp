class Workout < ApplicationRecord
  # constants
  WORKOUT_DIFFICULTIES = %i[beginner intermediate advanced]
  WORKOUT_STATUSES = %i[active inactive].freeze

  # configurations
  has_rich_text :description 
  enum difficulty: WORKOUT_DIFFICULTIES
  enum status: WORKOUT_STATUSES

  # associations
  has_many :workout_activities, dependent: :destroy
  has_many :variations, through: :workout_activities
  has_many :activities, through: :variations

  # validations
  validates :title, presence: true, length: { in: 6..30 }
  validates :description, length: { in: 6..150 }
  validates :difficulty, presence: true, inclusion: { in: Workout.difficulties.keys }
  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10_000 }
  validates :status, presence: true, inclusion: { in: Workout.statuses.keys }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 60, less_than_or_equal_to: 3600 }
  # validates :bundle_only, inclusion: { in: [true, false] }

  # models
  def duration_label
    ActiveSupport::Duration.build(duration).inspect
  end
end
