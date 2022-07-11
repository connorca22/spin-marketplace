class Order < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, foreign_key: "buyer_id", class: "User"
  belongs_to :seller, foreign_key: "seller_id", class: "User"
end
