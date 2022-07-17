class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  
  def home
  end

  def success
  end

  #stores bought, sold and active listings in instance variable for use in view.
  def profile
    @bought_products = current_user.bought_orders
    @sold_listings = current_user.sold_orders
    @unsold_listings = current_user.listings.where(sold: false)
  end 
end
