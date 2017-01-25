
json.extract! recipy, :id, :name, :description, :main_photo, :likes_count, :created_at

json.is_liked current_user.cookbook.recipies.include?(recipy) unless admin_signed_in?

json.author do
  if (recipy.user.nil?)
    json.name "admin"
    json.small_image Admin.find(1).image
  else
    json.name recipy.user.name
    json.small_image recipy.user.small_image
  end
end

json.url recipy_url(recipy, format: :json)
