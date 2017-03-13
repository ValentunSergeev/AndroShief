json.(@recipies) do |recipy|
  json.partial! 'recipies/recipy', recipy: recipy
end
