class ReservationsController < ApplicationController

def index
  @reservation = Reservation.all
end

def new
  @reservation = Reservation.new 
end

def create
end


end
