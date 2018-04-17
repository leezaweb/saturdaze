# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |x|
    User.create(username:Faker::Name.name, first_name:Faker::FamilyGuy.character.split(' ').first, last_name:Faker::FamilyGuy.character.split(' ').last)
    Event.create(name:Faker::SiliconValley.company, location_id:Location.create(name:Faker::StarWars.planet).id, host_id:x)
end

1..10.times do
  5.times do |x|
    Rsvp.create(event_id:x,guest_id:User.create(username:Faker::Name.name).id)
  end
end
