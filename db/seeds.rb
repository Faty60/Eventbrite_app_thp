# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.connection.tables.each do |table|
  if table != "ar_internal_metadata" && table != "schema_migrations"
    puts "Resetting auto increment ID for #{table} to 1"
    ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH 1")
  end
end

Attendance.destroy_all
Event.destroy_all
User.destroy_all


15.times do 
  user = User.create!(email: Faker::Name.first_name+"@yopmail.com",
                     password: Faker::Config.random.seed,
                     description: Faker::Lorem.paragraphs,
                     first_name: Faker::Name.first_name,
                     last_name:Faker::Name.last_name)
end
puts "*********************************************************"
puts "Les 15 fake users sont ok!"
puts "*********************************************************"

20.times do
  event = Event.create(start_date: Faker::Date.between(from: 3.days.from_now, to: 5.months.from_now),
                       duration: Faker::Number.between(from: 30, to: 90),
                       title: Faker::Book.title,
                       description: Faker::Lorem.sentence(word_count: 5),
                       price: Faker::Number.between(from: 15, to: 120),
                       location: Faker::Nation.capital_city,
                       admin_id: User.all.sample.id)
end
puts "*********************************************************"
puts "Les 20 fake events sont ok!"
puts"*********************************************************" 
