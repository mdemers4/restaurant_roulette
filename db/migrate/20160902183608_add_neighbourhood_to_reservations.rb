class AddNeighbourhoodToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :neighbourhood_id, :integer
  end
end
