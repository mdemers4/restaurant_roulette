class RestaurantsController < ApplicationController
	before_action :ensure_logged_in
	before_action :current_signed_in_user, only: [:index, :new, :create]
	before_action :get_neighbourhood, only: [:new, :create, :edit]
	before_action :get_restaurant, only: [:edit, :show, :update, :destroy]

	def index
		@restaurants = @user.owned_restaurants.all

	end
	def new
		@restaurant = Restaurant.new
	end


	def create
    	@restaurant = @user.owned_restaurants.create(restaurant_params)
		respond_to do |format|
			if @restaurant.save
				format.html { redirect_to user_restaurants_path(@user), notice: 'Restaurant was successfully created.' }
			else
				format.html { render :new , notice: 'failed to add' }
			end
	    end
	end

	def edit
	end


	def show
		@reservations = Reservation.get_reservations(@restaurant.id)
	end

	def update
		respond_to do |format|
			if @restaurant.update(restaurant_params)
				format.html {redirect_to user_restaurant_path, notice: 'Restaurant was successfully updated.'}
			else
				format.html {render :edit}
			end
		end
	end

	def destroy
		@restaurant.destroy
		@restaurant.reservations.destroy
		respond_to do |format|
			format.html { redirect_to user_restaurants_path, notice: 'Restaurant was successfully destroyed.' }
      		format.json { head :no_content }
      	end
	end




	private

	def get_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

	def get_neighbourhood
		@neighbourhoods = Neighbourhood.all
	end

	def current_signed_in_user
		@user = current_user
	end

	def restaurant_params
		params.require(:restaurant).permit(:description, :name, :address, :neighbourhood_id, :capacity)
	end

end
