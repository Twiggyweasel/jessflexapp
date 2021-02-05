FactoryBot.define do
  factory :plan do
    title { Faker::Lorem.sentence(word_count: 5) }
    description { Faker::Lorem.paragraph(sentence_count: 7) }
    status { Plan.statuses.keys[0] }
    price { rand(1000..4999) }
    difficulty { Plan.difficulties.keys[0] }
  end
end
