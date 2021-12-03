class ListingsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :find_listing, only: %i[show edit update]

    def index
        @listings = Listing.all
    end

    def authenticate_user
    end

    def show
    end

    def new
        # this sends @listing to new.html.erb 
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.new(listings_params)
        
        if @listing.save
            redirect_to @listing
        else
            render :new
        end

    end

    def edit
        
    end

    def update
        if @listing.update(listings_params)
            redirect_to @listing
        else
            render :edit
        end
    end

    private

    def find_listing
        @listing = Listing.find(params[:id])
    end

    def listings_params
        # because in the create method we already allocate listings to current user, it will already be able to access user_id, so we don't need to specify user_id here:
        params.require(:listing).permit(:name, :description, :price, :category_id)
    end
    
end