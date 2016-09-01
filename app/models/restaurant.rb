class Restaurant < ApplicationRecord
	validates :name, :address, presence: true
  belongs_to :user
  belongs_to :neighbourhood
  has_many :users, through: :reservations
end
