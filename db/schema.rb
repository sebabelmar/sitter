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

ActiveRecord::Schema.define(version: 20140907011513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "timeslots", force: true do |t|
    t.integer  "user_id"
    t.integer  "start_time"
    t.integer  "end_time"
    t.integer  "duration"
    t.integer  "availability", default: 1
    t.string   "kind",         default: "Sitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "family_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number_one"
    t.string   "phone_number_two"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
