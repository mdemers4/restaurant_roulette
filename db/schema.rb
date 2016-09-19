# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160919151702) do

  create_table "neighbourhoods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "size"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "neighbourhood_id"
    t.integer  "restaurant_id"
    t.integer  "time"
    t.string   "date"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "user_id"
    t.integer  "neighbourhood_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
    t.integer  "capacity"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["neighbourhood_id"], name: "index_restaurants_on_neighbourhood_id"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "saved_reservations", force: :cascade do |t|
    t.time     "time"
    t.date     "date"
    t.integer  "size"
    t.integer  "user_id"
    t.integer  "neighbourhood_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["neighbourhood_id"], name: "index_saved_reservations_on_neighbourhood_id"
    t.index ["restaurant_id"], name: "index_saved_reservations_on_restaurant_id"
    t.index ["user_id"], name: "index_saved_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
