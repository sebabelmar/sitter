# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  last_name = Faker::Name.last_name
  User.create(
    first_name: Faker::Name.first_name,
    last_name: last_name,
    family_name: "@the_#{last_name}s",
    password: "1234",
    email: "#{last_name}@gmail.com",
    phone_number_one: Faker::PhoneNumber.phone_number,
    phone_number_two: Faker::PhoneNumber.cell_phone,
    zip_code: Faker::Address.zip_code
    )
end

User.all.each do |user|
  friend = User.all.sample
  3.times do
    user.friends << friend if user.id != friend.id
  end
end

User.all.each do |user|
    day =%w{monday tuesday wednesday thurdays friday saturday}
    timeslot = Timeslot.create(
      start_time: Chronic.parse("next #{day.sample} at #{(1..8).to_a.sample}pm").to_i,
      duration: (1..4).to_a.sample,
      availability: (1..3).to_a.sample,
      kind: "Sitter"
      )
    user.timeslots << timeslot
end


