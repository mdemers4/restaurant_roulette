class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]


  def index
    @current_user = current_user
    @reservations = Reservation.all

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
        redirect_to root_path, notice: "Reservation created"
      else
        render "new", notice: "reservation was not added"
      end
  end


  private

  def reservation_params
    params.require(:reservation).permit(:time, :date, :size, :neighbourhood_id)
  end

end
