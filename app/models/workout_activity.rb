class WorkoutActivity < ApplicationRecord
  WORKOUT_ACTIVITY_DIFFICULTIES = %i[beginner intermediate advanced].freeze
  belongs_to :workout
  belongs_to :activity
  belongs_to :variation
  belongs_to :series

  enum difficulty: WORKOUT_ACTIVITY_DIFFICULTIES

  validates :difficulty, presence: true, inclusion: { in: WorkoutActivity.difficulties.keys }
end
