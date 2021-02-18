# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Ingredient.create(name: "Mint")
# Ingredient.create(name: "Vodka")
# Ingredient.create(name: "Rhum")
# Ingredient.create(name: "Tequila")
# Ingredient.create(name: "Orange Juice")
# Ingredient.create(name: "Tomato Juice")

require 'open-uri'
require 'json'

puts "Cleaning database..."
Ingredient.destroy_all

puts "Reading ingredient names..."
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients['drinks'].each do |i|
  ingredient  = Ingredient.create!(
    name: i['strIngredient1']
  )
  puts "Ingredient #{ingredient.name} succesfully created"
end
# puts "All the ingredients successfully created!"
# end
