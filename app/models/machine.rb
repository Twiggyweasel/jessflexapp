# Machines used in various acivities
class Machine < ApplicationRecord
  has_many :machine_exercises, dependent: :destroy
  has_many :exercises, through: :machine_exercises

  validates :name, presence: true
end
