class NeighbourhoodController < ApplicationController

  def new
  end

  def create
    @neighbourhood = Neighbourhood.new
  end

  def show
    @neighbourhood = Neighbourhood.find(params[:id])
    @restaurants = @neighbourhood.restaurants
    respond_to do |format|
        format.html
        format.json { render json: @restaurants}
    end
  end

end
