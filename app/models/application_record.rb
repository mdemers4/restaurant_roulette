class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  	def self.time_date_concat(reservation)

		# This method will calculate a way of getting time and date
		# and setting it as one single unit for chacking availability

		date = reservation.date[0,10]
		time = reservation.time
		datetime = "#{date} - #{time}"
  	end




	def self.is_available(restaurant)
		# This method will check through the database for restaurants
		# and return a true or false statement depending on their criteria:
		# neighbourhood, time, capacity
		hourly_capacity = restaurant.capacity
		reservation_hash = {}
		rest_reservations = Reservation.where(restaurant_id: restaurant.id)
		rest_reservations.each do |reservation|
			datetime = Reservation.time_date_concat(reservation)
			if reservation_hash.key?(datetime)
				reservation_hash[datetime] += reservation.size
			else
				reservation_hash[datetime] = reservation.size
			end
		end
		reservation_hash.each do |key, value|
			if value >= hourly_capacity
				reservation_hash[key] << false
			end
		end
		return reservation_hash
	end


	def self.convert_date(date)
		date[0,15]
	end


	def self.show_rest(rest_id)
		self.find_by(id: rest_id)
	end

	def self.get_reservations(rest_id)
		self.where(restaurant_id: rest_id)
	end

	def self.convert_time(time)
		collect_army_time = time
		if defined? collect_army_time
			if collect_army_time > 12
				return "#{collect_army_time % 12} PM"
			else
				return "#{collect_army_time} AM"
			end
		end
	end


end
