class AddDateStringToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :date, :string
  end
end
