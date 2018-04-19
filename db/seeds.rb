20.times do |x|
  Amenity.create(name:Faker::Job.title, description:Faker::Lorem.sentence(4), price_in_cents:Faker::Number.between(10000, 100000))
end

User.create(first_name: "Ryan", last_name: "Leeza", email: "admin@gmail.com", password: "admin")

dates= []
until dates.size == 10
  date = Faker::Date.forward(365)
  dates << date if date.saturday?
end

10.times do |x|
  firstname = Faker::FamilyGuy.character.split(' ').first
  lastname = Faker::FamilyGuy.character.split(' ').last

  User.create(first_name: firstname,
    last_name: lastname, email: "#{firstname.downcase}.#{lastname.downcase}@gmail.com",
    password:"password")

    Location.create(address:Faker::Address.street_address, name:Faker::StarWars.planet, description:Faker::Lorem.sentence(4))
    Event.create(name:Faker::SiliconValley.company, location_id:x+1, host_id:x+1, description:Faker::Lorem.sentence(4), date: dates.sample)
end

20.times do
  10.times do |x|
    Rsvp.create(event_id:x+1,guest_id:User.create(
      first_name:Faker::FamilyGuy.character.split(' ').first,
      last_name:Faker::FamilyGuy.character.split(' ').last).id)
    Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+11) if x%5 ==0
    Rsvp.find_or_create_by(event_id:(x+1).abs,guest_id:x+11)
    Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+1) if x%3 ==0
  end
end

20.times do |x|
  10.times do |y|
    EventAmenity.create(event_id:y+1, amenity_id:x+1) if x%10 == 0
    EventAmenity.create(event_id:y+1, amenity_id:(x-10).abs) if x%6 == 0
  end
end
