class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

	def is_available(restaurant)
		
=begin
This method will check through the database for restaurants
and return a true or false statement depending on their criteria:
	neighbourhood, time, capacity
	* wont need till later	
=end

	end

	def list_restaurants(neighbourhood)
=begin 
This method will iterate over a lot of restaurants, check if they are 
available, and return an array of restaurants
=end	
		restaurants = []
		neighbourhood_id = Neighbourhood.where(name: 'neighbourhood').first.id
		restaurants << Restaurant.where(neighbourhood_id: neighbourhood_id)
		return restaurants
	end

	def random_item(array)
=begin 
This method will shuffle the array of restaurants and return one 
=end
		return array.shuffle.sample	
	end

	


end
