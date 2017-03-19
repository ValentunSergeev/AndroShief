json.count @categories.size

json.categories(@categories) do |category|
  json.partial! 'categories/category', category: category
end
