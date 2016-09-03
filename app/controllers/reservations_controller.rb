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
  end

end
