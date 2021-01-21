FactoryBot.define do
  factory :activity do
    name { "MyString" }
    simple_desc { "MyString" }
    detail_desc { "MyString" }
    location { 1 }
    category { 1 }
    set_label { 1 }
    has_weight { false }
    machine_based { false }
  end
end
