class User < ApplicationRecord
  USER_ROLES = %i[admin user].freeze
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: USER_ROLES

  has_many :user_plans

  def has_role?(role)
    return true if self.role.to_sym == role

    false
  end
end
