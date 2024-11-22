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
puts "Creating 14 items..."
item = Item.new(name: "Seau-pas-sot", description: "seau qui te rend plus intelligent quand tu le porte sur la tête.", available: "available", price: 300, owner: User.find_by(email:"bernard@magicgarden.com") )
file = URI.parse("https://i.ibb.co/z7H1wsc/DALL-E-2024-11-22-15-21-15-A-whimsical-and-magical-bucket-designed-to-enhance-intelligence-when-worn.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Place Sainte-Anne, Rennes"
item.save!

item = Item.new(name: "Hair-rosoir", description: "arrosoir qui fait pousser les cheveux lorsque tu arrose ta tête.", available: "available", price: 300, owner: User.find_by(email:"bertille@magicgarden.com") )
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Rue Saint-Malo, Rennes"
item.save!

item = Item.new(name: "Flirtisseur", description: "râteau qui te donne des conseils de drague pour ne pour jamais te prendre de râteaux.", available: "available", price: 300, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://i.ibb.co/gybzzMQ/af5ba11e-fc63-4639-910b-0af6c0ef3b0d.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Eglise saint germain, Rennes"
item.save!

item = Item.new(name: "Scato-pelle", description: "pelle qui ramasse les crottes de chien dans ton jardin pour en faire de l’engrais.", available: "not available", price: 300, owner: User.find_by(email:"bernard@magicgarden.com") )
file = URI.parse("https://i.ibb.co/GJMy88y/DALL-E-2024-11-22-15-10-18-A-magical-self-operating-shovel-designed-to-pick-up-dog-waste-The-shovel.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Mail François Mitterrand, Rennes"
item.save!

item = Item.new(name: "Arrosound", description: "arrosoir qui fait de la musique pour faire pousser tes plantes.", available: "available", price: 100, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://i.ibb.co/n13QTXn/DALL-E-2024-11-22-15-20-34-A-whimsical-watering-can-that-plays-music-as-it-waters-The-watering-can-i.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Parc du Thabor, Rennes"
item.save!

item = Item.new(name: "Mignarrosoir", description: "arrosoir trop mignon à arc-en-ciel.", available: "available", price: 299, owner: User.find_by(email:"omar@magicgarden.com") )
file = URI.parse("https://i.ibb.co/StL5gdy/45976d07-67ee-4d81-80b5-9ec296e74c1f.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Rennes Cathedral, Rennes"
item.save!

item = Item.new(name: "Gratifieur", description: "Une pelle qui vous félicite à chaque pelletée.", available: "available", price: 380, owner: User.find_by(email:"bernard@magicgarden.com") )
file = URI.parse("https://i.ibb.co/RbhS9GP/DALL-E-2024-11-22-15-03-55-A-uniquely-designed-shovel-intended-to-convey-compliments-without-words-T.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Rue de la Soif, Rennes"
item.save!

item = Item.new(name: "Râteau Astrologue", description: "Vous dévoile votre horoscope tout en ratissant les feuilles mortes.", available: "available", price: 200, owner: User.find_by(email:"bertille@magicgarden.com") )
file = URI.parse("https://i.ibb.co/m9Zc4j1/b829863d-36cb-4775-900e-b86f9059923d.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "5 Boulevard magenta, Rennes"
item.save!

item = Item.new(name: "Herbicide Parfumé", description: "Elimine les mauvaises herbes tout en parfumant votre jardin.", available: "available", price: 100, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://i.ibb.co/b2cqyxp/DALL-E-2024-11-22-15-05-32-A-beautifully-designed-herbicide-sprayer-that-perfumes-the-garden-with-an.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "27 rue de brest, Rennes"
item.save!

item = Item.new(name: "Sécateur Cupidon", description: "Un sécateur qui coupe les rosiers et fait tomber amoureux vos voisins.", available: "available", price: 3000, owner: User.find_by(email:"omar@magicgarden.com") )
file = URI.parse("https://i.ibb.co/zs8Sm6g/DALL-E-2024-11-22-15-04-35-A-Cupid-inspired-pruning-shear-with-a-romantic-and-whimsical-design-The-h.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Rennes Cathedral, Rennes"
item.save!

item = Item.new(name: "La Pelle du Père Fouras", description: "Pour déterrer des énigmes ou vos trésors enfouis.", available: "available", price: 899, owner: User.find_by(email:"bertille@magicgarden.com") )
file = URI.parse("https://i.ibb.co/cC6N6fx/DALL-E-2024-11-22-15-06-31-A-uniquely-designed-shovel-in-the-shape-of-a-question-mark-with-a-sleek-a.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Rue Saint-Malo, Rennes"
item.save!

item = Item.new(name: "Composteur Surprise", description: "Transforme vos déchets en terreau... ou en feux d’artifice (parfois).", available: "available", price: 119, owner: User.find_by(email:"ophelie@magicgarden.com") )
file = URI.parse("https://i.ibb.co/KKwSdy4/DALL-E-2024-11-22-15-07-04-A-fantastical-compost-bin-that-launches-fireworks-as-it-processes-organic.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "Boulevard de la Liberté, Rennes"
item.save!

item = Item.new(name: "Faux du Destin", description: "Non seulement elle coupe l’herbe, mais elle prédit aussi si vous finirez riche ou tondu.", available: "available", price: 180, owner: User.find_by(email:"omar@magicgarden.com") )
file = URI.parse("https://i.ibb.co/yNzSZ3G/DALL-E-2024-11-22-15-07-45-A-mystical-scythe-designed-for-harvesting-wheat-while-predicting-the-futu.webp").open
item.photo.attach(io: file, filename: "#{item.name}.png", content_type: "image/png")
item.address = "cité judiciaire, Rennes"
item.save!







# 4. Create the instances of bookings
puts "Creating bookings..."
Booking.create!(start_date: Date.new(2024, 11, 15) , end_date: Date.new(2024, 12, 31),renter: User.find_by(email: "bertille@magicgarden.com"), item: Item.find_by(name: "Mignarrosoir"))
Booking.create!(start_date: Date.new(2024, 11, 18) , end_date: Date.new(2025, 1, 20),renter: User.find_by(email: "bernard@magicgarden.com"), item: Item.find_by(name: "Hair-rosoir"))
Booking.create!(start_date: Date.new(2024, 11, 15) , end_date: Date.new(2024, 12, 31),renter: User.find_by(email: "bertille@magicgarden.com"), item: Item.find_by(name: "Arrosound"))


# 5. Display a message 🎉
puts "Finished! Created #{Item.count} items, #{User.count} users and #{Booking.count} bookings."
