FactoryBot.define do
  factory :activity do
    name { "MyString" }
    simple_desc { "MyString" }
    detail_desc { "MyString" }

    location { 1 }
    category { 1 }
    set_type { 1 }

    weight { 1 }
    rep { 1 }
    set { 1 }

    machine_based { false }
    has_weight { false }
  end
end
