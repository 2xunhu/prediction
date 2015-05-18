# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150515061701) do

  create_table "postcodes", force: true do |t|
    t.float    "lat"
    t.float    "lon"
    t.integer  "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "predictiondata", force: true do |t|
    t.float    "temp"
    t.float    "rainfall"
    t.float    "winddir"
    t.float    "windspeed"
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "postcode_id"
  end

  add_index "predictiondata", ["postcode_id"], name: "index_predictiondata_on_postcode_id"

  create_table "rainfalls", force: true do |t|
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "readingdata_id"
  end

  add_index "rainfalls", ["readingdata_id"], name: "index_rainfalls_on_readingdata_id"

  create_table "readingdata", force: true do |t|
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  add_index "readingdata", ["station_id"], name: "index_readingdata_on_station_id"

  create_table "scrapers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stations", force: true do |t|
    t.float    "lat"
    t.float    "lon"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temperatures", force: true do |t|
    t.float    "temp"
    t.float    "maxtemp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "readingdata_id"
  end

  add_index "temperatures", ["readingdata_id"], name: "index_temperatures_on_readingdata_id"

  create_table "winds", force: true do |t|
    t.float    "speed"
    t.float    "maxspeed"
    t.float    "direction"
    t.float    "maxdirection"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "readingdata_id"
  end

  add_index "winds", ["readingdata_id"], name: "index_winds_on_readingdata_id"

end
