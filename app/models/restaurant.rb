class Restaurant < ApplicationRecord
	validates :name, :address, presence: true
	belongs_to :user
	belongs_to :neighbourhood
	has_many :reservations, dependent: :destroy
	has_many :users, through: :reservations


  geocoded_by :address
  after_validation :geocode

end
