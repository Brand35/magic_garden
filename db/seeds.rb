# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
puts "Creating X items..."
Item.create!(name: "Seau-pas-sot", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
puts "Created "
Item.create!(name: "Hair-rosoir", description: "arrosoir qui fait pousser les cheveux lorsque tu arrose ta tête.", available: "not available", price: 200, owner: User.find_by(email:"omar@magicgarden.com") )
puts "Created "
Item.create!(name: "Flirtisseur", description: "râteau qui te donne des conseils de drague pour ne pour jamais te prendre de râteaux.", available: "available", price: 120, owner: User.find_by(email:"ophelie@magicgarden.com") )
puts "Created "
Item.create!(name: "Scato-pelle", description: "pelle qui ramasse les crottes de chien dans ton jardin pour en faire de l’engrais", available: "available", price: 50, owner: User.find_by(email:"ophelie@magicgarden.com") )
puts "Created "
Item.create!(name: "Arrosound", description: "arrosoir qui fait de la musique pour faire pousser tes plantes", available: "pending", price: 70, owner: User.find_by(email:"omar@magicgarden.com") )
puts "Created "
Item.create!(name: "Mignarrosoir", description: "arrosoir trop mignon à arc-en-ciel", available: "pending", price: 60, owner: User.find_by(email:"omar@magicgarden.com") )
puts "Created "

# 4. Create the instances of bookings
puts "Creating bookings..."
Booking.create!(start_date: Date.new(2024, 11, 15) , end_date: Date.new(2024, 12, 31),renter: User.find_by(email: "bertille@magicgarden.com"), item: Item.find_by(name: "Mignarrosoir"))
Booking.create!(start_date: Date.new(2024, 11, 18) , end_date: Date.new(2025, 1, 20),renter: User.find_by(email: "bernard@magicgarden.com"), item: Item.find_by(name: "Hair-rosoir"))
Booking.create!(start_date: Date.new(2024, 11, 15) , end_date: Date.new(2024, 12, 31),renter: User.find_by(email: "bertille@magicgarden.com"), item: Item.find_by(name: "Arrosound"))


# 5. Display a message 🎉
puts "Finished! Created #{Item.count} items, #{User.count} users and #{Booking.count} bookings."
