# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Neighbourhood.create(
	name: "Little Italy")

Neighbourhood.create(
	name: "China Town")

Neighbourhood.create(
	name: "Liberty Village")


Restaurant.create(
	name: "papa's pizza",
	address: '123 college st',
	neighbourhood: 1 ,
	user: 1
	)
Restaurant.create(
  name: "dick's pizza",
  address: '124 college st',
  neighbourhood: 1 ,
  user: 1
  	)
Restaurant.create(
  name: "gino's pizza",
  address: '567 college st',
  neighbourhood: 1 ,
  user: 1
    	)
Restaurant.create(
  name: "more's pizza",
  address: '50 college st',
  neighbourhood: 2 ,
  user: 1
      	)
Restaurant.create(
  name: "pizza's pizza pizza",
  address: '70 college st',
  neighbourhood: 2 ,
  user: 1
        	)
Restaurant.create(
	name: "Luigi's pizza",
	address: '386 college st',
	neighbourhood: 2 ,
	user: 1
	)
Restaurant.create(
  name: "sushi rolls for everyone",
  address: '123 college st',
  neighbourhood: 2 ,
  user: 1
)
Restaurant.create(
	name: "Mother's Dumplings",
	address: '123 spedina st',
	neighbourhood: 3,
	user: 2
	)
Restaurant.create(
	name: "hipster central",
	address: 'east liberty st ',
	neighbourhood: 3,
	user: 3
	)


# @user = User.create(
# 	name: "mitch",
# 	email: "m@m.com",
# 	phone: "9059059050",
# 	password_digest: nil
# 	)

# Restaurant.create{
# 	name: "papa's pizza",
# 	address: '123 collage st',
# 	neighbourhood: @neighbourhood ,
# 	user: @user
# 	}

# User.create(
# 	name: "a",
# 	email: "a@m.com",
# 	phone: "9059459050",
# 	password_digest: nil
# 	)
# User.create(
# 	name: "b",
# 	email: "b@m.com",
# 	phone: "9059259050",
# 	password_digest: nil
# 	)

# Reservation.create(
# 	time: nil,
# 	date: nil,
# 	size: 5)
# Reservation.create(
# 	time: nil,
# 	date: nil,
# 	size: 3)
# Reservation.create(
# 	time: nil,
# 	date: nil,
# 	size: 7)
