#create 3 users
peter = User.create(email: "peter@wagon.com", first_name: "Peter", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Avid drone enthusiast")
stewie = User.create(email: "stewie@wagon.com", first_name: "Stewie", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Drone visionaire")
meg = User.create(email: "meg@wagon.com", first_name: "Meg", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Beginner drone flier")

sample_users = [peter, stewie, meg]

# create 3 drones per user

sample_users.each do |user|
  3.times do
    new_drone = Drone.create(user: user, title:Faker::Superhero.name, description: Faker::Superhero.power, rate: rand(10..200), address: Faker::Address.street_address)
    new_feature = Feature.create(drone: new_drone, category: "Professional", max_alt: 400, battery_life: "10 hours")
  end
end

# #create bookings
# t.integer  "user_id"
# t.integer  "drone_id"
# t.string   "status"
# t.date     "start_date"
# t.date     "end_date"
# t.integer  "original_rate"




