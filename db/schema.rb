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

ActiveRecord::Schema.define(version: 2018_10_05_055039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contribution_options", force: :cascade do |t|
    t.decimal "amount"
    t.string "amount_display"
    t.text "description"
    t.string "shipping_desc"
    t.string "delivery_desc"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donors", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string "token"
    t.string "transaction_id"
    t.string "address_one"
    t.string "address_two"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "status"
    t.string "number"
    t.string "udid"
    t.string "donor_id"
    t.string "pledge"
    t.string "shipping"
    t.string "tracking_number"
    t.string "phone"
    t.string "name"
    t.string "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contribution_option_id"
    t.boolean "completed", default: false
    t.datetime "time_of_contribution"
  end

end
