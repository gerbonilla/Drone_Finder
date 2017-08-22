class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :drone


  # def total_amount
  #   @number_of_days = (end_date.to_time.to_i - start_date.to_time.to_i)/86400
  #   @total_amount = @number_of_days * @drone.rate
  # end
end
