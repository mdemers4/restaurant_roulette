class NeighbourhoodController < ApplicationController

  def new
  end

  def create
    @neighbourhood = Neighbourhood.new
  end

end
