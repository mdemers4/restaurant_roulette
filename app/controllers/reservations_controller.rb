class ReservationsController < ApplicationController

def index
  @reservation = Reservation.all
end

def new
  @reservation = Reservation.new
  @neighbourhood = Neighbourhood.all

def create
end



end
