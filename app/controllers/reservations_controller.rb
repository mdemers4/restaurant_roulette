class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]


  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @neighbourhood = Neighbourhood.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to user_reservations_path(@user), notice: "Reservation created"
    else
      render "new"
    end
  end

end
