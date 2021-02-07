# defines all items related to users of the app
class User < ApplicationRecord
  has_many :plan_users, dependent: :destroy
  has_many :plans, through: :plan_users

  def full_name
    "#{first_name} #{last_name}"
  end

  def membership_used?
    plan_users.any?
  end
end
