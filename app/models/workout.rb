class Workout < ApplicationRecord
  WORKOUT_DIFFICULTIES = %i[beginner intermediate advanced]
  WORKOUT_STATUSES = %i[active inactive].freeze
  has_rich_text :description 

  has_many :workout_activities, dependent: :destroy
  has_many :variations, through: :workout_activities
  has_many :activities, through: :variations

  enum difficulty: WORKOUT_DIFFICULTIES
  enum status: WORKOUT_STATUSES

  validates :title, presence: true, length: { in: 6..30 }
  validates :description, length: { in: 6..150 }
  validates :difficulty, presence: true, inclusion: { in: Workout.difficulties.keys }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10_000 }
  validates :status, presence: true, inclusion: { in: Workout.statuses.keys }
  validates :bundle_only, inclusion: { in: [true, false] }

  def time_clean
    ActiveSupport::Duration.build(time).inspect
  end

  def price_clean
    return "Free" unless price > 0

    price
  end
end
