class SavedReservation < ApplicationRecord
  belongs_to :user
  belongs_to :neighbourhood
  belongs_to :restaurant
  has_one :reservation
end
