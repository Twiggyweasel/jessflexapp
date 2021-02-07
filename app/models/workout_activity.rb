class WorkoutActivity < ApplicationRecord
  belongs_to :workout
  belongs_to :variation
  has_one :activity, through: :activity_variation
end
