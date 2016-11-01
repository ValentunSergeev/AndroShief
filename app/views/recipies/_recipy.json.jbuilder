json.extract! recipy, :id, :name, :description, :main_photo, :created_at, :updated_at
json.url recipy_url(recipy, format: :json)