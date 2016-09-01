class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]


  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @neighbourhood = Neighbourhood.all

  def create
  end

end
