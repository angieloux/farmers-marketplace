class ListingsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :find_listing, only: %i[show edit update destroy]

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
        
        respond_to do |format|
            if @listing.save
                format.html { redirect_to @listing }
                
            else
                format.html { render :new }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @listing.update(listings_params)
                format.html { redirect_to @listing }
                
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @listing.destroy 

        redirect_to root_path
        
    end

    private

    def find_listing
        @listing = Listing.find(params[:id])
    end



    def listings_params
        # because in the create method we already allocate listings to current user, it will already be able to access user_id, so we don't need to specify user_id here:
        params.require(:listing).permit(:name, :image, :description, :price, :category)
    end
    
end