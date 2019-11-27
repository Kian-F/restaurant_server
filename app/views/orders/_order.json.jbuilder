json.extract! order, :id, :user_id, :line_item_id, :kind, :created_at, :updated_at
json.url order_url(order, format: :json)
