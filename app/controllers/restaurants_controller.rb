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
		@neighbourhood = Neighbourhood.find(params[:id])
		@restaurants = Restaurant.list_restaurants(@neighbourhood.name)
		@one_restaurant = Restaurant.random_item(@restaurants)
		return @one_restaurant
	end


	private

	def restaurant_params
		params.require(:restaurant).permit(:description, :name, :address, :neighbourhood_id)
	end


end
