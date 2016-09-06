class SavedReservationsController < ApplicationController

    def create 
      @user = current_user
      @saved_reservation = @user.saved_reservations.new(saved_reservation_params)
      if @saved_reservation.save
        redirect_to root_path, notice: "Reservation created"
      else
        render "new", notice: "reservation was not added"
      end
    end

    private

  def saved_reservation_params
    params.require(:saved_reservation).permit(:time, :date, :size, :neighbourhood_id, :restaurant_id)
  end


end
