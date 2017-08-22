class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_attachment :photo

DRONE_CATEGORIES = ["close range", "short range", "mid range", "endurance"]
DRONE_MAX_ALT = [50, 80, 100, 150, 200, 300, 500, 1000]
DRONE_RANGE = ["100m", "150m", "200m", "300m", "500m", "1000m", "3000m", "7000m"]
DRONE_BATTERY_LIFE = ["10 min", "15 min", "20 min", "25 min", "30 min", "45 min", "60 min"]
end
