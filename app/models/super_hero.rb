class SuperHero < ApplicationRecord
  include PgSearch
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :super_hero_powers, dependent: :destroy
  has_many :powers, through: :super_hero_powers

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  pg_search_scope :search_by_name,
    against: [ :name],
    associated_against: {
      powers: :name,
      super_hero_powers: :power_id
    },
    using: {
      tsearch: { prefix: true }
    }
end
