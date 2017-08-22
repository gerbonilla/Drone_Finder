class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :drone
  
  status = ["pending", "confirmed", "cancelled", "personal"]
  validates :status, :inclusion=> { :in => status }

  def available?(request_start, request_end)
    available = true
    available = false if (self.start_date >= request_start) && (self.start_date <= request_end)
    available = false if (self.end_date >= request_start) && (self.end_date <= request_end)
    return available
  end
  
  # def total_amount
  #   @number_of_days = (end_date.to_time.to_i - start_date.to_time.to_i)/86400
  #   @total_amount = @number_of_days * @drone.rate
  # end

end
