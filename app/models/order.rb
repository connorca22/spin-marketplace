class Order < ApplicationRecord
  #sets up associations with listings and users. 
  belongs_to :listing
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
end
