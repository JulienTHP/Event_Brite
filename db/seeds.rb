# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)







User.destroy_all
Event.destroy_all
Attendance.destroy_all
puts "database cleaned"
i = 0
j = 0
k = 0

20.times do 
  User.create(
    email: "bidon@yopmail.com",
    description: Faker::Hacker.say_something_smart,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    )
    i += 1
end

puts "Users created" if i == 20

10.times do
  Event.create(
    start_date: 1.day.from_now,
    duration: 15,
    title: Faker::Lorem.characters(60),
    description: Faker::Lorem.characters(300),
    price: Faker::Number.between(1, 999),
    location: Faker::Zelda.location,
    admin: User.all.sample
  )
  j += 1
end

puts "Events created" if j == 10

6.times do 
  Attendance.create(stripe_customer_id: 'blank',
    user: User.all.sample,
    event: Event.all.sample 
    )
    k += 1
  end

puts "attendences created" if k == 6








# puts 'Initialisation..'
# puts 'Cleaning the database..'
# User.destroy_all
# puts 'Users destroyed'
# Event.destroy_all
# puts 'Events destroyed'
# Attendance.destroy_all
# puts 'Attendances destroyed'
# puts 'Database cleaned'

# puts 'Starting to seed..'

# 10.times do
# 	User.create(first_name: Faker::Fallout.character, last_name: Faker::Fallout.character, email: "bidon@yopmail.com", description: Faker::Lovecraft.fhtagn)
# end
# puts "10 Users have been created"

# 20.times do
# 	Event.create(start_date: Faker::Date.forward(23), duration: Faker::Number.digit, title: Faker::TwinPeaks.quote, description: Faker::Lovecraft.fhtagn, price: Faker::Number.between(1,999), location: Faker::OnePiece.location)
# end
# puts "20 Events have been created"

# 30.times do 
# 	Attendance.create(stripe_customer_id: 'blank', user: User.all.sample, event: Event.all.sample)
# end

# puts 'database succesfully seeded'