class ListingsController < ApplicationController
  #runs all relevant methods before any action. 
  before_action :set_listing, only: %i[ show edit update destroy new_order]
  before_action :set_form_vars
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy] 

  # GET /listings or /listings.json
  # Navigates to the listings page. Creates instance variable and stores all listings inside it. 
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  # Navigates to the listing show page
  def show
  end

  # GET /listings/new
  #Navigates to the new listing page/form. Creates a new listing and stores it in @listing (not saved to database yet)
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  # Navigates to the edit listing page/form. 
  def edit
  end

  # POST /listings or /listings.json
  # If a post request is received to create new listings, then create a new record in listings table with listing params that have been 
  # passed in. Store this in a @listing variable. Then update the user_id on listing to the user creating the listing. Then advise the user
  # if the listing creation was successful or not. 
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  #If a patch/put request is received on a listing show page, then redirect to that page and advise user if edit was successsful or not. 
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  # deletes the selected record in listings table and responds with a success message when deleted.  
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

#executed when user clicks the purchase button on listing. 
#creates a record in the Order table and sets its listing id, seller id, and buyer id. 
#also updates the current record in listing tables sold value to true, and redirects to success page. 
  def new_order 
    Order.create(
      listing_id: @listing.id, 
      seller_id: @listing.user_id, 
      buyer_id: current_user.id 
    )
    @listing.update(sold: true)
    redirect_to order_success_path
  end 

  private
    #defines instance variables and stores Product Types, Conditions and Genres inside so they can be accessed in the view. 
    def set_form_vars 
      @product_types = ProductType.all 
      @conditions = Listing.conditions.keys
      @genres = Listing.genres.keys 
    end 

    #Throws alert if user attempts to edit or delete a listing beloning to someone else. Redirects to listings page. 
    def authorize_user 
      if @listing.user_id != current_user.id 
        flash[:alert] = "You do not own this listing." 
        redirect_to listings_path 
      end 
    end 
    
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :artist, :description, :condition, :genre, :price, :sold, :user_id, :image, :product_type_id)
    end
end
