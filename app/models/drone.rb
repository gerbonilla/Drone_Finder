class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_attachment :photo

  category = ["close range", "short range", "mid range", "endurance"]
  max_alt = [50, 80, 100, 150, 200, 300, 500, 1000]
  range = [100, 150, 200, 300, 500, 1000, 3000, 7000]
  battery_life = [10, 15, 20, 25, 30, 45, 60]

  validates :drone_categories, :inclusion=> { :in => drone_categories }
  validates :drone_max_alt, :inclusion=> { :in => drone_max_alt }
  validates :drone_range, :inclusion=> { :in => drone_range }
  validates :battery_life, :inclusion=> { :in => battery_life }
end


