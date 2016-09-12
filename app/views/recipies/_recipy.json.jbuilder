json.extract! recipy, :id, :name, :description, :created_at, :updated_at
json.url recipy_url(recipy, format: :json)