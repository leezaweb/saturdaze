User.create(first_name: "admin", last_name: "admin", email: "admin@gmail.com", password: "admin")
User.create(first_name: "Kyle", last_name: "DiPeppe", email: "kyledipeppe@gmail.com", password: "password")
User.create(first_name: "Max", last_name: "Goodman", email: "maxgoodman@gmail.com", password: "password")
User.create(first_name: "Deep", last_name: "Patel", email: "deeppatel@gmail.com", password: "password")
User.create(first_name: "Julio", last_name: "Torres", email: "juliotorres@gmail.com", password: "password")
User.create(first_name: "Austin", last_name: "Wolfe", email: "austinwolfe@gmail.com", password: "password")
User.create(first_name: "Mor", last_name: "Kenane", email: "morkenane@gmail.com", password: "password")
User.create(first_name: "Ryan", last_name: "Youngdale", email: "ryanyoungdale@gmail.com", password: "password")
User.create(first_name: "Leeza", last_name: "Luncheon", email: "leezaluncheon@gmail.com", password: "password")
User.create(first_name: "Jerry", last_name: "Lee", email: "jerrylee@gmail.com", password: "password")
User.create(first_name: "Bruno", last_name: "Garcia Gonzalez", email: "brunogarciagonzalez@gmail.com", password: "password")

Amenity.create(name: "Face Painting", description: "Great for birthday parties!", price_in_cents: 15000)
Amenity.create(name: "Photography", description: "Make sure that your event will never be forgotten with a professional photographer to capture memories!", price_in_cents: 40000)
Amenity.create(name: "Inflatables", description: "Choose from our wide range of inflatables! The kids will absolutely love bouncing around while you enjoy a drink from the bar.", price_in_cents: 27500)
Amenity.create(name: "Musician", description: "Ensure that your party has an upbeat feel with a professional musician", price_in_cents: 32500)
Amenity.create(name: "Full Bar", description: "No party is complete without drinks. Our professional bartenders will ensure your guests are well hydrated. (Must be 21 or older to purchase)", price_in_cents: 75000)
Amenity.create(name: "Dunk Tank", description: "Great for outdoor events in warm weather!", price_in_cents: 17000)
Amenity.create(name: "Clown", description: "Make sure to check if your kids are okay with this one first.", price_in_cents: 20000)
Amenity.create(name: "Beer Pong", description: "Sure to spice up any event! (Beer not included. Must be 21 or older to purchase.)", price_in_cents: 3000)
Amenity.create(name: "Cornhole", description: "What could be more fun than bean bags and wood? That's right. Nothing.", price_in_cents: 4000)
Amenity.create(name: "Magician", description: "You won't believe your eyes!", price_in_cents: 30000)
Amenity.create(name: "Popcorn Machine", description: "Keep your guests' stomachs full with delicious, buttery popcorn.", price_in_cents: 7500)
Amenity.create(name: "Photo Booth", description: "Make memories that you can take home with you at the end of the day with a photo booth!", price_in_cents: 12000)
Amenity.create(name: "Comedian", description: "Laugh the day away with a full comedy show at the end of your incredible party!", price_in_cents: 24000)
Amenity.create(name: "Juggler", description: "Andrew Cohn will amaze you with juggling tricks for hours! (Please tip)", price_in_cents: 1500)

Location.create(address: "1440 G St NW Washington DC 20005", name: "WeWork White House", description: "Have your party right in the heart of the nation's capitol with a beautiful view of the Washington Monument. Book today!")
Location.create(address: "92 avenue des Champs-Élysées Paris 75 75008", name: "WeWork Paris", description: "You can beat having your party practically in the shadow of the Eiffel Tower in downtown Paris")
Location.create(address: "Strawinskylaan 3101 Amsterdam 1077 ZX", name: "WeWork Amsterdam", description: "An incredible spot for an event surrounded by lots of history.")
Location.create(address: "64 York Street Sydney NSW 2000", name: "WeWork Sydney", description: "Have your party right next to the water down under!")
Location.create(address: "240 Richmond Street W Toronto ON M5V 1V6", name: "WeWork Toronto", description: "After your incredible party, go see a hockey game with all of the incredible fans in Toronto!")


# 20.times do |x|
#   Amenity.create(name:Faker::Job.title, description:Faker::Lorem.sentence(4), price_in_cents:Faker::Number.between(10000, 100000))
# end
#
# User.create(first_name: "Ryan", last_name: "Leeza", email: "admin@gmail.com", password: "admin")
#
# dates= []
# until dates.size == 10
#   date = Faker::Date.forward(365)
#   dates << date if date.saturday?
# end
#
# 10.times do |x|
#   firstname = Faker::FamilyGuy.character.split(' ').first
#   lastname = Faker::FamilyGuy.character.split(' ').last
#
#   User.create(first_name: firstname,
#     last_name: lastname, email: "#{firstname.downcase}.#{lastname.downcase}@gmail.com",
#     password:"password")
#
#     Location.create(address:Faker::Address.street_address, name:Faker::StarWars.planet, description:Faker::Lorem.sentence(4))
#     Event.create(name:Faker::SiliconValley.company, location_id:x+1, host_id:x+1, description:Faker::Lorem.sentence(4), date: dates.sample)
# end
#
# 20.times do
#   10.times do |x|
#     Rsvp.create(event_id:x+1,guest_id:User.create(
#       first_name:Faker::FamilyGuy.character.split(' ').first,
#       last_name:Faker::FamilyGuy.character.split(' ').last).id)
#     Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+11) if x%5 ==0
#     Rsvp.find_or_create_by(event_id:(x+1).abs,guest_id:x+11)
#     Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+1) if x%3 ==0
#   end
# end
#
# 20.times do |x|
#   10.times do |y|
#     EventAmenity.create(event_id:y+1, amenity_id:x+1) if x%10 == 0
#     EventAmenity.create(event_id:y+1, amenity_id:(x-10).abs) if x%6 == 0
#   end
# end
