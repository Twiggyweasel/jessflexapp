class PlanWorkout < ApplicationRecord
  belongs_to :plan
  belongs_to :workout
end
