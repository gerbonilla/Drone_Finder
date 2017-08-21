class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one :feature, dependent: :destroy

  has_attachment :photo
end
