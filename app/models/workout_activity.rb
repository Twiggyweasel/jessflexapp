class WorkoutActivity < ApplicationRecord
  belongs_to :workout
  belongs_to :activity_variation
  has_one :activity, through: :activity_variation
end
