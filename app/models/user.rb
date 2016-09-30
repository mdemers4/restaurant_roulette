class User < ApplicationRecord
	has_secure_password
	validates :name, :email, :phone, presence: true
	has_many :reservations, dependent: :destroy
	has_many :restaurants, through: :reservations, dependent: :destroy
	has_many :owned_restaurants, class_name: "Restaurant", dependent: :destroy
    #accepts_nested_attributes_for :reservations

end
