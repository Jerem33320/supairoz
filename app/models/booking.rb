class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :super_hero
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :rating, numericality: { only_integer: true }
end
