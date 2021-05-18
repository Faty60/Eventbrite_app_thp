# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all

15.times do 
  user = User.create(email: Faker::Name.first_name+"@yopmail.com",
                     
                     description: Faker::Lorem.paragraphs,
                     first_name: Faker::Name.first_name,
                     last_name:Faker::Name.last_name)
end
puts "*********************************************************"
puts "Les 15 fake users sont ok!"
puts "*********************************************************"