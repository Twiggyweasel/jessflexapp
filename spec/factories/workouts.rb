FactoryBot.define do
  factory :workout do
    title { Faker::Lorem.sentence(word_count: 2) }
    description { Faker::Lorem.paragraph(sentence_count: 1) }
    duration { rand(60..600) }
    status { Workout.statuses.keys[1] }
    difficulty { Workout.difficulties.keys[0] }

    factory :workout_with_activities do
      transient do
        activity_count { 5 }
      end

      after(:create) do |workout, evaluator|
        create_list(:workout_activity, evaluator.activity_count, workout: workout)

        workout.reload
      end
    end
  end
end
