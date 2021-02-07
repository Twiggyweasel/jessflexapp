FactoryBot.define do
  factory :plan_user do
    purchase_date { "2021-02-04" }
    referral { false }
    plan
    user
  end
end
