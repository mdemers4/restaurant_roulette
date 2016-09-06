class CreateSavedReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_reservations do |t|
      t.time :time
      t.date :date
      t.integer :size
      t.references :user, foreign_key: true
      t.references :neighbourhood, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
