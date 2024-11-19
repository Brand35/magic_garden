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
Item.destroy_all
User.destroy_all

# 2. Create the instances of items 🏗️
puts "Creating X items..."
Item.create(name: "", description: "", available: "", price: 10, owner_id: )
puts "Created "
Item.create(name: "", description: "", available: "", price: 10, owner_id: )
puts "Created "
Item.create(name: "", description: "", available: "", price: 10, owner_id: )
puts "Created "
Item.create(name: "", description: "", available: "", price: 10, owner_id: )
puts "Created "
Item.create(name: "", description: "", available: "", price: 10, owner_id: )
puts "Created "
Item.create(name: "", description: "", available: "", price: 10, owner_id: )
puts "Created "

# 3. Create the instances of users (owner/renter)
puts "Creating Users..."
User.create(email: "", password: "", first_name: "", last_name: "")
User.create(email: "", password: "", first_name: "", last_name: "")
User.create(email: "", password: "", first_name: "", last_name: "")
User.create(email: "", password: "", first_name: "", last_name: "")

# 3. Display a message 🎉
puts "Finished! Created #{Item.count} items and #{User.count} users."
