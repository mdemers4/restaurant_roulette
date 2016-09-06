class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  	def self.time_and_date_overlap()
=begin 
This method will calculate a way of getting time and date 
and setting it as one single unit for chacking availability
=end
  	end




	def self.is_available(restaurant)	
=begin
This method will check through the database for restaurants
and return a true or false statement depending on their criteria:
	neighbourhood, time, capacity
	* wont need till later			
=end
		restaurant_info = Restaurant.find_by(name: restaurant)
		rest_id = restaurant_info.id
		capacity = restaurant_info.capacity
		count = 0 
		Reservation.where(restaurant_id: rest_id).find_each do |party_size|
			count += party_size
			if count > capacity 
				return false
			end
		end
		return true


		# to finish this method i need to know how we add date
		# and time to the Database
	end





	def self.list_restaurants(neighbourhood_id)
=begin 
This method will iterate over a lot of restaurants, check if they are 
available, and return an array of restaurants
=end	
		restaurants = []
		# neighbourhood_id = Neighbourhood.where(name: neighbourhood).first.id
		restaurants << Restaurant.where(neighbourhood_id: neighbourhood_id)
		return restaurants
	end





	def self.random_item(array)
=begin 
This method will shuffle the array of restaurants and return one OBJECT 
=end
		return array[0].shuffle.sample	
	end


	def self.show_rest(rest_id)
		rest = Restaurant.where(id: rest_id)
		rest[0] 
	end

	def self.get_reservations(rest_id)
		SavedReservation.where(restaurant_id: rest_id)
	end



end
