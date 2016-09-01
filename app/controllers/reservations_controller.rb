class ReservationsController < ApplicationController

def index
  @reservation = Reservation.all
end

def new
  @reservation = Reservation.new
  @neighbourhood = Neighbourhood.all
end

def create
end



end
