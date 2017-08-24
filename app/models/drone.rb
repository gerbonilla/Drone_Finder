class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  has_attachments :photos, maximum: 4
  DRONE_CATEGORIES = ["close range", "short range", "mid range", "endurance"]
  DRONE_MAX_ALT = [50, 80, 100, 150, 200, 300, 500, 1000]
  DRONE_RANGE = [100, 150, 200, 300, 500, 1000, 3000, 7000]
  DRONE_BATTERY_LIFE = [10, 15, 20, 25, 30, 45, 60]

  def available?(request_start, request_end)
    available = true
    self.bookings.each do |b|
      available = false unless b.available?(request_start, request_end)
    end
    return available
  end

  def average_rating
    reviews = self.reviews.where(type: "DroneReview")
    average = 0
    reviews.each do |review|
      average += review.rating
    end
    average = average / reviews.length unless reviews.length.zero?
    return average
  end

  scope :category, -> (category) { where category: category }
  scope :max_alt, ->(alt) { where('max_alt > ?', alt) }
  scope :range, ->(distance) { where('range > ?', distance) }
  scope :battery_life, ->(time) { where('battery_life > ?', time) }
  scope :rate, ->(amount) { where('rate < ?', amount) }

  # validates :category, :inclusion=> { :in => DRONE_CATEGORIES }
  # validates :max_alt, :inclusion=> { :in => DRONE_MAX_ALT }
  # validates :range, :inclusion=> { :in => DRONE_RANGE }
  # validates :battery_life, :inclusion=> { :in => DRONE_BATTERY_LIFE }

  # For Google Geocode Lookup
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end


