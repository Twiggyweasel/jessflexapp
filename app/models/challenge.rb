class Challenge < ApplicationRecord
  has_many :challenge_sets
  has_many :activity_sets through: :challenge_sets

  validates :name, presense: true
end
