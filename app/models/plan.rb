class Plan < ApplicationRecord
  # constants
  STATUSES = %i[hidden available soldout retired].freeze
  DIFFICULTIES = %i[beginner intermediate advanced].freeze

  # enums
  enum status: STATUSES
  enum difficulty: DIFFICULTIES

  # associations
  has_many :plan_workouts, dependent: :destroy
  has_many :workouts, through: :plan_workouts
  has_many :plan_users, dependent: :destroy
  has_many :users, through: :plan_users

  # validations
  validates :title, presence: true, length: { in: 6..60 }
  validates :description, length: { in: 6..400 }
  validates :price, presence: true, numericality: { greater_than_equal_to: 0, less_than_equal_to: 10_000 }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :difficulty, presence: true, inclusion: { in: difficulties.keys }

  # scopes
  scope :hidden, -> { where(status: :hidden) }
  scope :available, -> { where(status: :available) }
  scope :retired, -> { where(status: :retired) }

  # methods
  def has_previewable_workouts?
    plan_workouts.where(previewable: true).count >= 1
  end
end
