FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :user_with_plans do
      transient do
        plans_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:plan_user, evaluator.plans_count, user: user)
        user.reload
      end
    end
  end

  # def user_with_active_membership(plans_count: 5)
  #   FactoryBot.create(:user) do |user|
  #     FactoryBot.create_list(:plan_users, user: user)
  #   end
  # end
end
