# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# restaurant_roulette

WE DEM FUCKING BOIS, BOIS.



1. user come to landing page
  - sign-up and login
  - little blurb about what the app is and how it works
    - let restaurant roulette decide where you'd want to eat

2. sign-up page
  - name, email, phone, password_digest, confirm password
  - link to user home page right away

3. login page
  - email and password_digest
  - little blurb about get ready to eat some stuff

4. user home page
  - show current reservations
  - link to "restaurant roulette"
  - link to "manage my restaurants schedules"

5. restaurant roulette page
  - form with fields: date(drop down), time(drop down), party size(drop down), neighborhood(drop down)
  - Big button(say some cool shit), link to confirmation page

6. Restaurants schedules page
  - link to each restaurant schedule page (a)
  - link to make a new restaurant (b)

  6a. each restaurant schedule page
    - shows reservations for that restaurant
    - link to back
  6b. make a new restaurant page
    - form with fields: name, address, neighborhood
    - submit takes user back to restaurant pages

7. confirmation page
  - restaurant image and info
  - user input from restaurant roulette page
  - yes or try again
    - if yes, link to user home page with new reservations
    - if try again, refresh a new restaurant on the confirmation page
