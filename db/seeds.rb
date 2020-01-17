require 'open-uri'
require 'json'

puts "Clearing database..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

puts "Creating new items.."
ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
get_ingredients = open(ingredients_url).read
get_cocktails = open(cocktails_url).read

JSON.parse(get_ingredients)["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

JSON.parse(get_cocktails)["drinks"].each do |cocktail|
  Cocktail.create!(
    name: cocktail['strDrink'],
    image_url: cocktail["strDrinkThumb"]
    )
end

puts "Items created : #{Cocktail.count}"
