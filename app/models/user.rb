class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #sets up associations with listings and orders
  has_many :listings 
  has_many :bought_orders, foreign_key: "buyer_id", class_name: "Order" 
  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order" 
end
