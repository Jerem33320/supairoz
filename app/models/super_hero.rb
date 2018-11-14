class SuperHero < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :super_hero_powers
  has_many :powers, through: :super_hero_powers

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
