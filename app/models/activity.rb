class Activity < ApplicationRecord
  enum location: [:home, :gym]
  enum category: [:upper_body, :lower_body, :abs, :HIIT]
  enum set_type: [:count, :minutes, :seconds]

  validates :name, presence: true, uniqueness: true, length: { in: 6..30 }
  validates :simple_desc, presence: true, length: { in: 6..60 }
  validates :detail_desc, presence: true, length: { in: 6..300 }
  validates :location, presence: true
  validates :category, presence: true
  validates :set_type, presence: true
  validates :rep, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :set, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :weight, presence: true if: { has_weight }
end
