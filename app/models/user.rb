class User < ApplicationRecord
	has_secure_password
	validates :name, :email, :phone, presence: true
	has_many :reservations
    has_many :saved_reservations
	has_many :restaurants, through: :reservations
	has_many :owned_restaurants, class_name: "Restaurant"
    #accepts_nested_attributes_for :reservations

end
