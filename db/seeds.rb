require 'open-uri'
require 'json'

puts "Deleting all seeds"
Ingredient.delete_all

puts "Creating new ingedientss.."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
get_ingredients = open(url).read
cocktails = JSON.parse(get_ingredients)
drinks = cocktails['drinks']

drinks.each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
end

puts "..Finished creating"
