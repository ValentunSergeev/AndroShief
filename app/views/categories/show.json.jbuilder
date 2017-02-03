json.partial! "categories/category", category: @category

json.recipies(@category.recipies) do |recipy|
  json.partial! "recipies/recipy", recipy: recipy
end
