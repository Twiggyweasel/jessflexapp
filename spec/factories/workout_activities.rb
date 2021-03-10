FactoryBot.define do
  factory :workout_activity do
    activity
    workout
    variation { association :variation, activity: activity }
    series { association :series, activity: activity }
    difficulty { WorkoutActivity.difficulties.keys[0] }
  end
end
