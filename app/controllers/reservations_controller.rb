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

private

def reservation_params
  params.require(:reservation).permit(:date, :time, :size, :restaurant_id, :neighbourhood_id)
end

end
