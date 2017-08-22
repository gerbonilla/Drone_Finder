class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_attachments :photos, maximum: 4
end
