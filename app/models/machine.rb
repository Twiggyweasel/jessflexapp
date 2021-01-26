# Machines used in various acivities
class Machine < ApplicationRecord
  belongs_to :activity

  validates :name, presense: true
end
