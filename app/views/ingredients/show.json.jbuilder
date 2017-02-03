json.partial! "ingredients/ingredient", ingredient: @ingredient

json.recipies(@ingredient.recipies) do |recipy|
  json.partial! "recipies/recipy", recipy: recipy
end
