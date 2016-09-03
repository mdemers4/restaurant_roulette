class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]


  def index
    @reservations = Reservation.all
    @users = User.all
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new
    @reservation = Reservation.new
    @neighbourhood = Neighbourhood.all
	end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    num_of_restaurants = count(@neighbourhood.restaurant)
    random_num = rand(0..num_of_restaurants)
    @reservation.restaurant = random_num
    if @reservation.save
      redirect_to user_reservations_path(@user), notice: "Reservation created"
    else
      render "new"
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time, :date, :size)
  end

end
