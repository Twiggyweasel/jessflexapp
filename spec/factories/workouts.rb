FactoryBot.define do
  factory :workout do
    title { Faker::Lorem.sentence(word_count: 2) }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    bundle_only { true }
    status { Workout.statuses.keys[0] }

    factory :unbundled_workout do
      bundle_only { false }
    end
  end
end
