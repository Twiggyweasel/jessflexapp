# defines the defaults for an activity record to be used in variates and workouts
class Activity < ApplicationRecord
  # relationships
  has_one :machine_activity, dependent: :destroy
  has_one :machine, through: :machine_activity
  has_many :variations, dependent: :destroy
  has_many :series, dependent: :destroy

  enum location: { gym: 0, anywhere: 1 }
  enum category: { upper_body: 0, lower_body: 1, abs: 2, HIIT: 3 }
  enum set_label: { number: 0, minutes: 1, seconds: 2 }

  validates :name, presence: true, uniqueness: true, length: { in: 6..30 }
  validates :simple_desc, presence: true, length: { in: 6..60 }
  validates :detail_desc, presence: true, length: { in: 6..300 }
  validates :location, presence: true, inclusion: { in: locations.keys }
  validates :category, presence: true, inclusion: { in: categories.keys }
  validates :set_label, presence: true, inclusion: { in: set_labels.keys }

  validates :has_weight, inclusion: { in: [true, false] }
  validates :machine_based, inclusion: { in: [true, false] }
end
