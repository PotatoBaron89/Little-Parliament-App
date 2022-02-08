json.extract! food, :id, :title, :description, :price, :created_at, :updated_at
json.url food_url(food, format: :json)
