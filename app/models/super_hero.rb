class SuperHero < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :super_hero_powers
end
