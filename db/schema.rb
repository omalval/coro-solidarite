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

ActiveRecord::Schema.define(version: 2020_03_13_004635) do

  create_table "gardes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "unity"
    t.integer "quantity_max"
    t.date "start_availability_date"
    t.date "end_availability_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gardes_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "reservation_quantity", default: 0
    t.date "pick_up_date", default: "2020-03-13"
    t.text "reservation_comment"
    t.integer "user_id"
    t.integer "gardes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gardes_id"], name: "index_reservations_on_gardes_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

end
