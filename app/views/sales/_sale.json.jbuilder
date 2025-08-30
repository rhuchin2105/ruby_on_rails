json.extract! sale, :id, :cumtomer_id, :seller_id, :product_id, :price, :amount, :seller_address, :created_at, :updated_at
json.url sale_url(sale, format: :json)
