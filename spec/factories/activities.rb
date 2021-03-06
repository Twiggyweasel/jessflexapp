FactoryBot.define do
  factory :activity do
    name { Faker::Lorem.characters(number: 10, min_alpha: 10) }
    simple_desc { Faker::Lorem.paragraph(sentence_count: 1) }
    detail_desc { Faker::Lorem.paragraph(sentence_count: 9) }
    location { Activity.locations.keys[0] }
    category { Activity.categories.keys[0] }
    set_label { Activity.set_labels.keys[0] }
    has_weight { false }
    machine_based { false }

    factory :weighted_activity do
      has_weight { true }
    end
  end
end
