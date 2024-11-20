# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
require "open-uri"

# 1. Clean the database 🗑️
puts "Cleaning database..."
Booking.destroy_all
Item.destroy_all
User.destroy_all

# 3. Create the instances of users (owner/renter)
puts "Creating Users..."
User.create!(email: "bernard@magicgarden.com", password: "password", first_name: "Bernard", last_name:"Cactus")
User.create!(email: "bertille@magicgarden.com", password: "password", first_name: "Bertille", last_name:"Aloe")
User.create!(email: "ophelie@magicgarden.com", password: "password", first_name: "Ophélie", last_name:"Vera")
User.create!(email: "omar@magicgarden.com", password: "password", first_name: "Omar", last_name:"Ficus")

# 2. Create the instances of items 🏗️
puts "Creating 6 items..."
item = Item.new(name: "Seau-pas-sot", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://static8.depositphotos.com/1337050/865/i/450/depositphotos_8657566-stock-photo-bucket-head-businessman.jpg").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.save!

item = Item.new(name: "Hair-rosoir", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://img.freepik.com/photos-gratuite/homme-chauve-triste-detresse-tenant-mains-visage-detourner-regard_176420-18519.jpg?t=st=1732100783~exp=1732104383~hmac=89ba9b2dcf70724f969ed745088226dcd3d37411464dce87ad69a78b12c64d39&w=2000").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.save!

item = Item.new(name: "Flirtisseur", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://shop.majardinerie.com/botans/1509-large_default/rateau-14-dents.jpg").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.save!

item = Item.new(name: "Scato-pelle", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://static.fnac-static.com/multimedia/Images/7E/17/F7/12/19886462-1505-1505-1/tsp20220718204716/Pelle-Ramae-Crotte-pour-Chien-FONGWAN-28cm-Poignee-Outil-de-Nettoyage-pour-Grands-Petits-Chiens-Violet.jpg").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.save!

item = Item.new(name: "Arrosound", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://www.radiofrance.fr/s3/cruiser-production-eu3/2021/04/c28ec281-3f1e-4a5b-971e-6390f352f97d/640x340_fils_de_flute.jpg").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.save!

item = Item.new(name: "Mignarrosoir", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://www.mister-arrosage.com/wp-content/uploads/2024/02/mini-arrosoir-en-forme-d-elephant-mignon-4.jpg").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.save!


# 4. Create the instances of bookings
puts "Creating bookings..."
Booking.create!(start_date: Date.new(2024, 11, 15) , end_date: Date.new(2024, 12, 31),renter: User.find_by(email: "bertille@magicgarden.com"), item: Item.find_by(name: "Mignarrosoir"))
Booking.create!(start_date: Date.new(2024, 11, 18) , end_date: Date.new(2025, 1, 20),renter: User.find_by(email: "bernard@magicgarden.com"), item: Item.find_by(name: "Hair-rosoir"))
Booking.create!(start_date: Date.new(2024, 11, 15) , end_date: Date.new(2024, 12, 31),renter: User.find_by(email: "bertille@magicgarden.com"), item: Item.find_by(name: "Arrosound"))


# 5. Display a message 🎉
puts "Finished! Created #{Item.count} items, #{User.count} users and #{Booking.count} bookings."
