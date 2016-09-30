class NeighbourhoodController < ApplicationController

  def new
  end

  def create
    @neighbourhood = Neighbourhood.new
  end

  def show
    @rest_hash_arr =[]
    @neighbourhood = Neighbourhood.find(params[:id])
    @restaurants = @neighbourhood.restaurants
    @restaurants.each do |restaurant|
        @rest_hash_arr << Restaurant.is_available(restaurant)
    end
    respond_to do |format|
        format.html
        #format.json { render json: @rest_hash_arr} # @restaurants}
        format.json { render json: @restaurants}
    end
  end

end
