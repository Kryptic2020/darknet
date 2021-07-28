json.extract! cart, :id, :payment_intent, :receipt_url, :total_amount, :user_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
