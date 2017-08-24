
# Arrays for drone filters - (see drone validation)
a_category = ["close range", "short range", "mid range", "endurance"]
a_max_alt = [50, 80, 100, 150, 200, 300, 500, 1000]
a_range = [100, 150, 200, 300, 500, 1000, 3000, 7000]
a_battery_life = [10, 15, 20, 25, 30, 45, 60]

puts "Beginning seeding.  Hang in there, this takes a while..."

# Notes for valid booking filters - see booking validation

User.destroy_all
Drone.destroy_all
Booking.destroy_all

puts "Destroyed old data.  Now I'll make some users..."

#create 9 users
peter = User.create(email: "peter@wagon.com", first_name: "Peter", last_name: "Griffin", password:"123456", password_confirmation: "123456", description: "Avid drone enthusiast")
peter.photo_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/PeterYarrowByPhilKonstantin.jpg/220px-PeterYarrowByPhilKonstantin.jpg"
puts "Peter's done."

stewie = User.create(email: "stewie@wagon.com", first_name: "Stewie", last_name: "Smith", password:"123456", password_confirmation: "123456", description: "Drone visionaire")
stewie.photo_url = "http://www.rockstart.com/wp-content/uploads/2012/06/bas-300x300.jpg"
puts "Stewie's all set."

meg = User.create(email: "meg@wagon.com", first_name: "Meg", last_name: "Jones", password:"123456", password_confirmation: "123456", description: "Beginner drone flier")
meg.photo_url = "https://i.ytimg.com/vi/8bzreh78Sgo/maxresdefault.jpg"

tom = User.create(email: "tom@wagon.com", first_name: "Tom", last_name: "Lennon", password:"123456", password_confirmation: "123456", description: "Just getting into this drone stuff")
tom.photo_url = "https://pbs.twimg.com/media/BcINeMVCIAABeWd.jpg"

richard = User.create(email: "richard@wagon.com", first_name: "Richard", last_name: "McCartney", password:"123456", password_confirmation: "123456", description: "My middle name is Drone")
richard.photo_url = "http://vignette3.wikia.nocookie.net/althistory/images/7/74/Recent-portraits-random-people-in-random-places_11.jpg/revision/latest?cb=20141209232111"
puts "Same goes for Meg, Tom and Richard."

harry = User.create(email: "harry@wagon.com", first_name: "Harry", last_name: "Jackson", password:"123456", password_confirmation: "123456", description: "I live for drones!")
harry.photo_url = "https://www.demilked.com/magazine/wp-content/uploads/2015/10/random-people-portraits-reimagine-simpsons-valerie-zaremska-13.jpg"

paul = User.create(email: "paul@wagon.com", first_name: "Paul", last_name: "Prince", password:"123456", password_confirmation: "123456", description: "Droning on about drones...")
paul.photo_url = "https://pbs.twimg.com/profile_images/496104994152906754/eP3c0xiB_400x400.jpeg"

ringo = User.create(email: "ringo@wagon.com", first_name: "Ringo", last_name: "McEnroe", password:"123456", password_confirmation: "123456", description: "To drone, or not to drone.")
ringo.photo_url = "https://yt3.ggpht.com/-donKzgz_HnU/AAAAAAAAAAI/AAAAAAAAAAA/yOyWWOCCXwM/s900-c-k-no-mo-rj-c0xffffff/photo.jpg"
puts "And Harry, Paul and Ringo..."

john = User.create(email: "john@wagon.com", first_name: "John", last_name: "Lendle", password:"123456", password_confirmation: "123456", description: "I love drones!")
john.photo_url = "http://www.sawtagadir.com/files/news/machahire/2016/1/google.jpg"
puts "Last, but not least, John's done."

puts "Created 9 users with photos."

sample_users = [peter, stewie, meg, tom, richard, harry, paul, ringo, john]

urls = ["https://media.golfdigest.com/photos/55ad8f86b01eefe207f73e00/master/pass/courses-2014-06-coar01-using-drones-620.jpg",
        "http://www.govexec.com/media/gbc/docs/pdfs_edit/centcom-isis-drone-2.jpg",
        "http://guyhaas.com/bfoit/itp/images/drone.jpg",
        "http://img.bfmtv.com/c/1256/708/bfm/1198557.jpg",
        "https://cdn.geekwire.com/wp-content/uploads/2016/08/160829-drone-sunset-faa-630x435.jpg",
        "https://ichef-1.bbci.co.uk/news/640/cpsprodpb/FB9D/production/_88631446_88631445.jpg",
        "http://www.dronesglobe.com/wp-content/uploads/2017/01/drones-suitable-for-beginners_web.jpg",
        "https://media.licdn.com/mpr/mpr/AAEAAQAAAAAAAAgLAAAAJDk1ZmI1NDIxLWY2NjYtNGMzMC05M2I4LTIzYTM0ZTU1MTcyMg.jpg",
        "http://www.teanewsdirect.com/file/2017/07/ueav0jbcurphq6tmkxpj.png",
        "https://assets.pcmag.com/media/images/497813-dji-phantom-4-810.jpg?thumb=y&width=810&height=456",
        "http://1.bp.blogspot.com/_tNyjz8QgUlM/TLwdPm2UmvI/AAAAAAAAAF0/XIL6X5YSTug/s1600/parrot_AR.Drone_041.jpg",
        "http://www.cityofslt.us/images/pages/N859/Drone.jpg",
        "https://cdn.vox-cdn.com/uploads/chorus_asset/file/8573285/0d1efa5e3f3c1ba93e8f5210c1b312f2_original.jpg",
        "https://fortunedotcom.files.wordpress.com/2017/05/drones.gif",
        "http://thewirecutter5.wpengine.netdna-cdn.com/wp-content/uploads/2017/03/drones-parrot-mambo-lowres-7264.jpg",
        "https://myfirstdrone.com/wp-content/uploads/2017/01/DJI-Mavic-Pro-unfolded-Top-Drones-for-sale.jpg",
        "http://www.argos.co.uk/content/dam/argos/static-pages/features/drones/Drones_wk41_eCom_76.jpg",
        "https://images.wondershare.com/filmora/article-images/what-is-drone.jpg",
        "http://thewirecutter5.wpengine.netdna-cdn.com/wp-content/uploads/2017/03/drones-dji-phantom-3-lowres-.jpg",
        "https://drones.masters.upc.edu/en/shared/images/drones3.jpg",
        "http://static3.businessinsider.com/image/56f444d1910584cc5e8b87ce-1190-625/heres-how-drone-usage-is-set-to-explode-by-2020.jpg",
        "https://www.wired.com/wp-content/uploads/2015/12/flying-drones-easier-than-ever-42-78304942.jpg"]

a_address = ["Friedrichstraße 207, Berlin",
                "Leipziger Pl. 12-13, Berlin",
                "Alte Potsdamer Str. 7, Berlin",
                "Schwedenstraße 9B, 13359 Berlin",
                "Linienstraße 132, 10115 Berlin",
                "Hauptstraße 133, 10827 Berlin",
                "Hermannstraße 149, 12051 Berlin",
                "Schwedenstraße 20, 13359 Berlin",
                "Linienstraße 180, 10115 Berlin",
                "Hauptstraße 211, 10827 Berlin",
                "Hermannstraße 321, 12051 Berlin",
                "Wilmersdorfer Str. 53/54, 10627 Berlin",
                "Wittenbergpl. 4, 10789 Berlin",
                "Karl-Marx-Straße 119, 12043 Berlin",
                "Friedrich-Ebert-Straße 95, 14467 Potsdam",
                "Zeppelinstraße 146, 14471 Potsdam",
                "Potsdamer Str. 176, 14469 Potsdam",
                "159 Rue Montmartre, 75002 Paris, France",
                "80 Boulevard Diderot, 75012 Paris, France",
                "112B Rue de Rennes, 75006 Paris, France",
                "7 Fulham Broadway, Fulham, London SW6 1AA, UK",
                "304 Kilburn High Road, London, Kilburn NW6 2DB, United Kingdom",
                "11A Islington High St, London N1 9LQ, UK",
                "Unit 9/14 Bull La, London N18 1SX, United Kingdom",
                "Lindenthaler Str. 66, 04155 Leipzig",
                "Jahnallee 31, 04109 Leipzig",
                "Karl-Liebknecht-Straße 59, 04275 Leipzig"]


num_drones = [1, 1, 1, 1, 2, 2, 2, 3, 4]

puts "Creating some drones for each user..."

# create some drones per user
sample_users.each do |user|
  num_drones.sample.times do
    new_drone = Drone.new(user: user,
      title:Faker::Superhero.name,
      description: Faker::Superhero.power,
      rate: rand(10..200),
      address: a_address.sample,
      category: a_category.sample,
      max_alt: a_max_alt.sample,
      range: a_range.sample,
      battery_life: a_battery_life.sample)

    new_drone.save!
    new_drone.photo_urls = urls.shuffle.first(4)
  end
  puts "Created #{user.first_name}'s drones."
end

puts "All done with drones, onto bookings..."


status = ["pending", "confirmed", "declined", "completed"]

messages = ["Thanks!  Can't wait to fly the drone.",
            "Looking forward to it!  Thank you...",
            "Hello, I really like your drone. It would be absolutly terrific if I could rent it for the weekend",
            "Cool!",
            "Hey, there's a chance I'll have to cancel but I hope not!",
            "The photos look great.  I'll see you this weekend!",
            "Dude, I hope it's not too hard to fly, I've already wrecked five!",
            "Hope to see you Friday, thanks!",
            "It's going to be great!!!"]

Drone.all.each do |drone|
  sample_users.delete(drone.user)
  Booking.create(user: sample_users.sample, message: messages.sample, drone_id: drone.id, status: 'pending', start_date: Date.new(2017, 8, rand(26..30)), end_date: Date.new(2017, 9, rand(1..7)))
  Booking.create(user: sample_users.sample, message: messages.sample, drone_id: drone.id, status: 'confirmed', start_date: Date.new(2017, 8, rand(26..30)), end_date: Date.new(2017, 9, rand(1..7)))
  Booking.create(user: sample_users.sample, message: messages.sample, drone_id: drone.id, status: 'declined', start_date: Date.new(2017, 8, rand(26..30)), end_date: Date.new(2017, 9, rand(1..7)))
  Booking.create(user: sample_users.sample, message: messages.sample, drone_id: drone.id, status: status.sample, start_date: Date.new(2017, 8, rand(26..30)), end_date: Date.new(2017, 9, rand(1..7)))
  Booking.create(user: sample_users.sample, message: messages.sample, drone_id: drone.id, status: status.sample, start_date: Date.new(2017, 8, rand(26..30)), end_date: Date.new(2017, 9, rand(1..7)))

  rand(1..4).times do
    Booking.create(user: sample_users.sample, drone_id: drone.id, status: 'comlpeted', start_date: Date.new(2017, 8, rand(26..30)), end_date: Date.new(2017, 9, rand(1..7)))
  end
  sample_users = [peter, stewie, meg, tom, richard, harry, paul, ringo, john]
end

# # create bookings
# Booking.create(user: stewie, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 8, 30), end_date: Date.new(2017, 9, 4))
# Booking.create(user: stewie, drone_id: random_drone.sample, status: "confirmed", start_date: Date.new(2017, 10, 10), end_date: Date.new(2017, 10, 17))
# Booking.create(user: peter, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 8, 25), end_date: Date.new(2017, 9, 16))
# Booking.create(user: peter, drone_id: random_drone.sample, status: "rejected", start_date: Date.new(2017, 12, 25), end_date: Date.new(2017, 12, 27))
# Booking.create(user: meg, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 11, 10), end_date: Date.new(2017, 11, 12))
# Booking.create(user: meg, drone_id: random_drone.sample, status: "confirmed", start_date: Date.new(2017, 8, 26), end_date: Date.new(2017, 8, 30))

# Booking.create(user: tom, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 8, 30), end_date: Date.new(2017, 9, 4))
# Booking.create(user: tom, drone_id: random_drone.sample, status: "confirmed", start_date: Date.new(2017, 10, 10), end_date: Date.new(2017, 10, 17))
# Booking.create(user: richard, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 8, 25), end_date: Date.new(2017, 9, 16))
# Booking.create(user: richard, drone_id: random_drone.sample, status: "rejected", start_date: Date.new(2017, 12, 25), end_date: Date.new(2017, 12, 27))
# Booking.create(user: harry, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 11, 10), end_date: Date.new(2017, 11, 12))
# Booking.create(user: harry, drone_id: random_drone.sample, status: "confirmed", start_date: Date.new(2017, 8, 26), end_date: Date.new(2017, 8, 30))

# Booking.create(user: paul, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 8, 30), end_date: Date.new(2017, 9, 4))
# Booking.create(user: paul, drone_id: random_drone.sample, status: "confirmed", start_date: Date.new(2017, 10, 10), end_date: Date.new(2017, 10, 17))
# Booking.create(user: ringo, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 8, 25), end_date: Date.new(2017, 9, 16))
# Booking.create(user: ringo, drone_id: random_drone.sample, status: "rejected", start_date: Date.new(2017, 12, 25), end_date: Date.new(2017, 12, 27))
# Booking.create(user: john, drone_id: random_drone.sample, status: "pending", start_date: Date.new(2017, 11, 10), end_date: Date.new(2017, 11, 12))
# Booking.create(user: john, drone_id: random_drone.sample, status: "confirmed", start_date: Date.new(2017, 8, 26), end_date: Date.new(2017, 8, 30))

puts "Bookings created, now doing reviews for each booking."

#create reviews for bookings
Booking.all.each do |booking|
    DroneReview.create(booking: booking, rating: rand(1..5), title: Faker::FamilyGuy.quote, content: Faker::HitchhikersGuideToTheGalaxy.quote)
    UserReview.create(booking: booking, rating: rand(1..5), title: Faker::FamilyGuy.quote, content: Faker::HitchhikersGuideToTheGalaxy.quote)
end

puts "That's it, all done.  Addresses can be in Berlin, Potsdam, Leipzig, Paris and London"
