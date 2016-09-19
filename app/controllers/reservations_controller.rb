class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]


  def index
    @user = current_user
    @reservations = @user.reservations
  end

  def new
    @reservation = Reservation.new
    @neighbourhoods = Neighbourhood.all

	 end


  def create
    @user = current_user
    @neighbourhoods = Neighbourhood.all
    @reservation = @user.reservations.create(reservation_params)
      if @reservation.save
        render json: @reservation
        else
          render "new", notice: "reservation was not added"
        end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.show_rest(@reservation.restaurant_id)
    @hash = Gmaps4rails.build_markers(@restaurant) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:success] = "Reservation Deleted!" 
    redirect_to reservations_path 
  end


  private

  def reservation_params
    params.require(:reservation).permit(:time, :date, :size, :neighbourhood_id, :restaurant_id)
  end

end

