class User < ApplicationRecord
	has_many :reservations
	has_many :restaurants, through: :reservations
	has_many :owned_restaurants, class_name: "Restaurant"
end
