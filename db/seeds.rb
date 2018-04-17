
10.times do |x|
    User.create(full_name:Faker::Name.name)
    Event.create(name:Faker::SiliconValley.company, host_id:x+1)
end

20.times do
  10.times do |x|
    Rsvp.create(event_id:x+1,guest_id:User.create(full_name:Faker::Name.name).id)
    Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+11)
    Rsvp.find_or_create_by(event_id:(x+1).abs,guest_id:x+11)
    Rsvp.find_or_create_by(event_id:(x-10).abs,guest_id:x+1)
  end
end
