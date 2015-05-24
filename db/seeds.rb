require 'faker'

# Create Users
5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   # user.skip_confirmation!
   user.save!
 end
 users = User.all
 
 
# Create To-Do Items 
20.times do
  item = Item.create!(
    user:   users.sample,
    name:   Faker::Lorem.sentence
    )
    
    # set the created_at time to within the past year
    # item.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Item.count} items created"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
