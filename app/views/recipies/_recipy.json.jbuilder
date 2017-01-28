
json.extract! recipy, :id, :name, :description, :main_photo, :likes_count, :created_at

json.is_liked (current_user || current_admin).cookbook.recipies.include?(recipy)

json.author do
    json.name recipy.user.name
    json.small_image recipy.user.small_image
end

json.url recipy_url(recipy, format: :json)
