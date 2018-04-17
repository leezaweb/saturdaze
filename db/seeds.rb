20.times do |x|
  Amenity.create(name:Faker::Job.title, description:Faker::Lorem.sentence(4), price_in_cents:Faker::Number.between(10000, 100000))
end

10.times do |x|
    User.create(first_name:Faker::FamilyGuy.character.split(' ').first,
    last_name:Faker::FamilyGuy.character.split(' ').last)
    Location.create(address:Faker::Address.street_address, name:Faker::StarWars.planet, description:Faker::Lorem.sentence(4))
    Event.create(name:Faker::SiliconValley.company, location_id:x+1, host_id:x+1, description:Faker::Lorem.sentence(4))
end

20.times do
  10.times do |x|
    Rsvp.create(event_id:x+1,guest_id:User.create(
      first_name:Faker::FamilyGuy.character.split(' ').first,
      last_name:Faker::FamilyGuy.character.split(' ').last).id)
    Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+11)
    Rsvp.find_or_create_by(event_id:(x+1).abs,guest_id:x+11)
    Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+1)
  end
end
