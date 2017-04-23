json.extract! restaurant, :id, :name, :picture, :website, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
