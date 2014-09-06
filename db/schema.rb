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

ActiveRecord::Schema.define(version: 20140906075652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "crops", force: true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crops", ["room_id"], name: "index_crops_on_room_id", using: :btree
  add_index "crops", ["user_id"], name: "index_crops_on_user_id", using: :btree

  create_table "drivers", force: true do |t|
    t.string   "token"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "operations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "operations", ["user_id"], name: "index_operations_on_user_id", using: :btree

  create_table "plants", force: true do |t|
    t.string   "name"
    t.integer  "strain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "stage"
    t.float    "yield"
    t.integer  "crop_id"
  end

  add_index "plants", ["crop_id"], name: "index_plants_on_crop_id", using: :btree
  add_index "plants", ["strain_id"], name: "index_plants_on_strain_id", using: :btree
  add_index "plants", ["user_id"], name: "index_plants_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "readings", force: true do |t|
    t.string   "name"
    t.float    "value"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "driver_id"
  end

  add_index "readings", ["driver_id"], name: "index_readings_on_driver_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "temperature"
    t.integer  "operation_id"
    t.integer  "user_id"
  end

  add_index "rooms", ["operation_id"], name: "index_rooms_on_operation_id", using: :btree
  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id", using: :btree

  create_table "sensors", force: true do |t|
    t.string   "type"
    t.integer  "room_id"
    t.integer  "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "sensors", ["plant_id"], name: "index_sensors_on_plant_id", using: :btree
  add_index "sensors", ["room_id"], name: "index_sensors_on_room_id", using: :btree
  add_index "sensors", ["user_id"], name: "index_sensors_on_user_id", using: :btree

  create_table "strains", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
