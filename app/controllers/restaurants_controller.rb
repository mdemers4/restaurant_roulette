class RestaurantsController < ApplicationController
	before_action :ensure_logged_in

	def index
		@current_user = current_user
		@restaurants = @current_user.owned_restaurants.all

	end
	def new
		@restaurant = Restaurant.new
		@neighbourhoods = Neighbourhood.all
	end


	def create
    	@neighbourhoods = Neighbourhood.all
    	@user = current_user
    	@restaurant = @user.owned_restaurants.create(restaurant_params)

		respond_to do |format|
			if @restaurant.save
				format.html { redirect_to user_restaurants_path(@user), notice: 'Restaurant was successfully created.' }
			else
				format.html { render :new , notice: 'failed to add' }

			end
	    end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservations = SavedReservation.get_reservations(@restaurant.id)
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		respond_to do |format|
			format.html { redirect_to user_restaurants_path, notice: 'User was successfully destroyed.' }
      		format.json { head :no_content }
      	end
	end


	private

	def restaurant_params
		params.require(:restaurant).permit(:description, :name, :address, :neighbourhood_id, :capacity)
	end


end
