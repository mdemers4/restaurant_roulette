class RemoveRestaurantIdfromReservation < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :restaurant_id, :integer 
  end
end
