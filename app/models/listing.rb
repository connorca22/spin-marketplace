class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :product_type
  has_rich_text :description
end
