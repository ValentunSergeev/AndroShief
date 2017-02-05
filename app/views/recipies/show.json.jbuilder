json.partial! "recipies/recipy", recipy: @recipy

json.cook_time @recipy.cook_time
json.proteins @recipy.proteins
json.fats @recipy.fats
json.carbohydrates @recipy.carbohydrates

json.steps(@recipy.steps) do |step|
  json.name step.name
  json.description step.description
  json.timer step.timer
  json.image step.image
end

json.ingredients(@recipy.ingredients) do |ingredient|
  json.partial! "ingredients/ingredient", ingredient: ingredient
end

json.categories(@recipy.categories) do |category|
  json.name category.name
end
