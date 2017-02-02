json.partial! "recipies/recipy", recipy: @recipy

json.steps(@recipy.steps) do |step|
  json.name step.name
  json.description step.description
  json.image step.image
end

json.ingredients(@recipy.ingredients) do |ingredient|
  json.partial! "ingredients/ingredient", ingredient: ingredient
end
