class RemoveRestFromReservation < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :restaurant_id
  end
end
