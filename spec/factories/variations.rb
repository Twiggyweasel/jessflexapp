FactoryBot.define do
  factory :variation do
    description { "Testing description" }
    # difficulty { Variation.difficulties.keys[0] }
    weight { 1 }
    activity
  end
end
