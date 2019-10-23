# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cadastrando contatos...'

100.times do
  kind = Kind.new(
    name: Faker::Name.name
  )

  address = Address.new(
    street: Faker::Address.street_address,
    city: Faker::Address.city
  )

  phones = []
  Random.rand(5).times do
    phones << Phone.new(number: Faker::PhoneNumber.cell_phone)
  end

  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.between(from: 50.years.ago, to: 10.years.ago),
    kind: kind,
    address: address,
    phones: phones
  )
end

# puts 'Cadastrando phones...'

# Contact.all.each  do |contact|
#   Random.rand(5).times do |i|
#     Phone.create!(number: Faker::PhoneNumber.cell_phone,
#                   contact: contact)
#   end
# end

# puts 'Cadastrando addresses...'

# Contact.all.each  do |contact|
#   address = Address.create(
#     street: Faker::Address.street_address,
#     city: Faker::Address.city,
#     contact: contact
#   )
# end
