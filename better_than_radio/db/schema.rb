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

ActiveRecord::Schema.define(version: 20140804204543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "artistname",   null: false
    t.string   "genre",        null: false
    t.string   "contactname",  null: false
    t.string   "contactphone", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "members", force: true do |t|
    t.string   "firstname",  null: false
    t.string   "location",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "username",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "venuename",   null: false
    t.string   "location",    null: false
    t.string   "phonenumber", null: false
    t.string   "contactname", null: false
    t.integer  "capacity",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
