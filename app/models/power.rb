class Power < ApplicationRecord
  has_many :super_hero_powers

  validates :name, presence: true
end
