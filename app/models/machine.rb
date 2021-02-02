# Machines used in various acivities
class Machine < ApplicationRecord
  has_many :machine_activities, dependent: :destroy
  has_many :activities, through: :machine_activities

  validates :name, presence: true
end
