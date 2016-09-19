class AddIntTimeToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :time, :integer
  end
end
