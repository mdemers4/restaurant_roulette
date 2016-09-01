class RestaurantsController < ApplicationController
	def new
		@restaurants = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
	end

	def show
		@neighbourhood = Neighbourhood.find(params[:id])
		@restaurants = Restaurant.list_restaurants(@neighbourhood.name)
		@one_restaurant = Restaurant.random_item(@restaurants)
		return @one_restaurant
	end 


	private 

	def restaurant_params
		params.require(:restaurant).permit(:name, :address)
	end


end
