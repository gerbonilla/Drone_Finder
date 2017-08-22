class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :drone

  status = ["pending", "confimed", "cancelled", "personal"]
  validates :status, :inclusion=> { :in => status }
end
