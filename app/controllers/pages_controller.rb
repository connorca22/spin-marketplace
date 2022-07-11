class PagesController < ApplicationController
  def home
  end

  def success
  end

  def profile
    @bought_products = current_user.bought_orders
    @sold_listings = current_user.sold_orders
    @unsold_listings = current_user.listings.where(sold: false)
  end 
end
