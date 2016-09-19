class DropSavedReservation < ActiveRecord::Migration[5.0]
  def change
    drop_table :saved_reservations
  end
end
