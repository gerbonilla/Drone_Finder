
# Notes for valid drone filters - see drone validation
category = ["close range", "short range", "mid range", "endurance"]
max_alt = [50, 80, 100, 150, 200, 300, 500, 1000]
range = [100, 150, 200, 300, 500, 1000, 3000, 7000]
battery_life = [10, 15, 20, 25, 30, 45, 60]

# Notes for valid booking filters - see booking validation
status = ["pending", "confimed", "cancelled", "personal"]


#create 3 users
User.destroy_all
peter = User.create(email: "peter@wagon.com", first_name: "Peter", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Avid drone enthusiast")
stewie = User.create(email: "stewie@wagon.com", first_name: "Stewie", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Drone visionaire")
meg = User.create(email: "meg@wagon.com", first_name: "Meg", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Beginner drone flier")

sample_users = [peter, stewie, meg]

# create 3 drones per user
Drone.destroy_all
sample_users.each do |user|
  3.times do
    new_drone = Drone.create(user: user, title:Faker::Superhero.name, description: Faker::Superhero.power, rate: rand(10..200), address: Faker::Address.street_address, category: "Professional", max_alt: 400, battery_life: "10 hours")
  end
end

# create bookings
Booking.destroy_all
Booking.create(user: stewie, drone_id: 1, status: "pending")
Booking.create(user: stewie, drone_id: 8, status: "accepted")
Booking.create(user: peter, drone_id: 5, status: "pending")
Booking.create(user: peter, drone_id: 8, status: "rejected")
Booking.create(user: meg, drone_id: 2, status: "pending")
Booking.create(user: meg, drone_id: 5, status: "accepted")
