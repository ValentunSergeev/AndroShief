if (admin_signed_in?)
  json.admin_name current_admin.name
end

json.recipes(@recipies) do |recipy|
  json.partial! 'recipies/recipy', recipy: recipy
end
