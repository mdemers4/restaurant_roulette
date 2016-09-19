class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  	def self.time_and_date_overlap(reservation_object)
=begin
This method will calculate a way of getting time and date
and setting it as one single unit for chacking availability
=end
	# time = reservation_object.time
	# date = 

  	end




	def self.is_available(restaurant)
=begin
This method will check through the database for restaurants
and return a true or false statement depending on their criteria:
	neighbourhood, time, capacity
	* wont need till later
=end
		reservation = {}
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


	def self.show_rest(rest_id)
		self.find_by(id: rest_id)
	end

	def self.get_reservations(rest_id)
		self.where(restaurant_id: rest_id)
	end

	def self.convert_time(time)
		collect_army_time = time
		if collect_army_time > 12
			return "#{collect_army_time % 12} PM"
		else
			return "#{collect_army_time} AM"
		end
	end


end
