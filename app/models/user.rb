# defines all items related to users of the app
class User < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end
end
