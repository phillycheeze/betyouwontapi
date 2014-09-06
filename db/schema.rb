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

ActiveRecord::Schema.define(version: 20140906091838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: true do |t|
    t.string   "token"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "drivers", ["manager_id"], name: "index_drivers_on_manager_id", using: :btree

  create_table "managers", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  create_table "readings", force: true do |t|
    t.string   "name"
    t.float    "value"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "driver_id"
  end

  add_index "readings", ["driver_id"], name: "index_readings_on_driver_id", using: :btree
end
