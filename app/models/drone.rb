class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_attachment :photo
  DRONE_CATEGORIES = ["close range", "short range", "mid range", "endurance"]
   DRONE_MAX_ALT = [50, 80, 100, 150, 200, 300, 500, 1000]
  DRONE_RANGE = [100, 150, 200, 300, 500, 1000, 3000, 7000]
  DRONE_BATTERY_LIFE = [10, 15, 20, 25, 30, 45, 60]
  
  validates :categories, :inclusion=> { :in => DRONE_CATEGORIES }
  validates :max_alt, :inclusion=> { :in => DRONE_MAX_ALT }
  validates :range, :inclusion=> { :in => DRONE_RANGE }
  validates :battery_life, :inclusion=> { :in => DRONE_BATTERY_LIFE }
  


end


