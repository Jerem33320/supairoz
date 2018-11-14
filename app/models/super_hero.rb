class SuperHero < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :super_hero_powers
  has_many :powers, through: :super_hero_powers

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true
end
