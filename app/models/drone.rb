class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one :feature
  accepts_nested_attributes_for :feature

  has_attachment :photo
end
