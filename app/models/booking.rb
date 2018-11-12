class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :super_hero
end
