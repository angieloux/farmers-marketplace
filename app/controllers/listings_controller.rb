class ListingsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :find_listing, only: %i[show edit update destroy]
    before_action :set_form_variables, only: %i[new edit]

    def index
        # Eager load the listings
        @listings = Listing.search(params[:search]).includes(:user, :category)
        @categories = Category.all
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
                format.html { redirect_to @listing, notice: "Listing was successfully created." }
                format.json { render :show, status: :created, location: @listing }                
            else
                set_form_variables
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @listing.errors, status: :unprocessable_entity }            
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @listing.update(listings_params)
                format.html { redirect_to @listing, notice: "Listing was successfully updated." }
                format.json { render :show, status: :ok, location: @listing }
              else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @listing.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @listing.destroy 
        respond_to do |format|
            format.html { redirect_to root_path, notice: "Listing was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def find_listing
        @listing = Listing.find(params[:id])
    end



    # Only allow a list of trusted parameters through.
    def listings_params
        # because in the create method we already allocate listings to current user, it will already be able to access user_id, so we don't need to specify user_id here:
        params.require(:listing).permit(:name, :image, :description, :price, :category_id)
    end

    def set_form_variables
        @categories = Category.all
        @features = Feature.all
      end 
    
end