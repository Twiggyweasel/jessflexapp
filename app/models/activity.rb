class Activity < ApplicationRecord
  enum location: [:home, :gym]
  enum category: [:upper_body, :lower_body, :abs, :HIIT]
  enum set_label: [:number, :minutes, :seconds]

  validates :name, presence: true, uniqueness: true, length: { in: 6..30 }
  validates :simple_desc, presence: true, length: { in: 6..60 }
  validates :detail_desc, presence: true, length: { in: 6..300 }
  validates :location, presence: true, inclusion: { in: locations.keys }
  validates :category, presence: true, inclusion: { in: categories.keys }
  validates :set_label, presence: true, inclusion: { in: set_labels.keys }

  validates :has_weight, inclusion: { in: [true, false] }
  validates :machine_based, inclusion: { in: [true, false] }
end