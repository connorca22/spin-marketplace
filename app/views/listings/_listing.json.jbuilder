json.extract! listing, :id, :title, :artist, :description, :condition, :genre, :price, :sold, :user_id, :product_type_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.description listing.description.to_s
