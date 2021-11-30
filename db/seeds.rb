# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Booking.destroy_all
Family.destroy_all
User.destroy_all

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end


10.times do
  family = Family.new(
    race: Family::ETHNICITY.sample,
    title: Faker::TvShows::FamilyGuy.character,
    description: Faker::TvShows::FamilyGuy.quote,
    location: Faker::Address.city,
    price: rand(1..10),
    adult_male: rand(0..2),
    adult_female: rand(0..2),
    child_male: rand(0..2),
    child_female: rand(0..2),
    senior_male: rand(0..2),
    senior_female: rand(0..2),
    user: User.all.sample
  )
  family.save!
end

10.times do
  start_date = Date.today + rand(-10..20)
  end_date = start_date + rand(20..30)
  family = Family.all.sample
  booking = Booking.new(
    start_date: start_date,
    end_date: end_date,
    payment_method: Booking::PAYMENT_METHODS.sample,
    total_price: (end_date - start_date) * family.price,
    user: User.all.sample,
    status: Booking::STATUSES.sample,
    family: family
  )
  booking.save!
end
