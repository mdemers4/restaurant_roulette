class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]


  def index
    @current_user = current_user
    @reservations = current_user.saved_reservations


  end

  def new
    @reservation = Reservation.new
    @neighbourhoods = Neighbourhood.all
	end


  def create
    @user = current_user
    @neighbourhoods = Neighbourhood.all
    @reservation = @user.reservations.new(reservation_params)
      if @reservation.save
        redirect_to reservation_path(@reservation), notice: "Reservation created"
      else
        render "new", notice: "reservation was not added"
      end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @neighbourhood_id = @reservation.neighbourhood.id
    @restaurants = Restaurant.list_restaurants(@neighbourhood_id)
    @chosen_restaurant = Restaurant.random_item(@restaurants)
  end


  private

  def reservation_params
    params.require(:reservation).permit(:time, :date, :size, :neighbourhood_id)
  end

end
