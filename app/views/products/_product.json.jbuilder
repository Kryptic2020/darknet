json.extract! product, :id, :condition, :title, :description, :price, :shipped_from, :delivery_est, :available, :sold, :user_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
