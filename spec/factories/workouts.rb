FactoryBot.define do
  factory :workout do
    title { Faker::Lorem.sentence(word_count: 2) }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    duration { rand(60..600) }
    status { Workout.statuses.keys[0] }

  end
end
