class Series < ApplicationRecord
  belongs_to :activity
  has_many :workout_activities, dependent: :nullify

  validates :rep, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :set, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
