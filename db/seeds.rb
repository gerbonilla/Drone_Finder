
# Notes for valid drone filters - see drone validation
# category = ["close range", "short range", "mid range", "endurance"]
# max_alt = [50, 80, 100, 150, 200, 300, 500, 1000]
# range = [100, 150, 200, 300, 500, 1000, 3000, 7000]
# battery_life = [10, 15, 20, 25, 30, 45, 60]

# Notes for valid booking filters - see booking validation
status = ["pending", "confimed", "cancelled", "personal"]
User.destroy_all
Drone.destroy_all
Booking.destroy_all

#create 3 users
peter = User.create(email: "peter@wagon.com", first_name: "Peter", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Avid drone enthusiast")
stewie = User.create(email: "stewie@wagon.com", first_name: "Stewie", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Drone visionaire")
meg = User.create(email: "meg@wagon.com", first_name: "Meg", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Beginner drone flier")

sample_users = [peter, stewie, meg]

# create 3 drones per user
sample_users.each do |user|
  3.times do
    new_drone = Drone.create!(user: user, title:Faker::Superhero.name, description: Faker::Superhero.power, rate: rand(10..200), address: Faker::Address.street_address, category: "endurance", max_alt: 500, range: 150, battery_life: 60)
  end
end

# create bookings
Booking.create(user: stewie, drone_id: 1, status: "pending", start_date: Date.new(2017, 8, 30), end_date: Date.new(2017, 9, 4))
Booking.create(user: stewie, drone_id: 1, status: "confirmed", start_date: Date.new(2017, 10, 10), end_date: Date.new(2017, 10, 17))
Booking.create(user: peter, drone_id: 5, status: "pending", start_date: Date.new(2017, 8, 25), end_date: Date.new(2017, 9, 16))
Booking.create(user: peter, drone_id: 8, status: "rejected", start_date: Date.new(2017, 12, 25), end_date: Date.new(2017, 12, 27))
Booking.create(user: meg, drone_id: 2, status: "pending", start_date: Date.new(2017, 11, 10), end_date: Date.new(2017, 11, 12))
Booking.create(user: meg, drone_id: 5, status: "confirmed", start_date: Date.new(2017, 8, 26), end_date: Date.new(2017, 8, 30))
