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

ActiveRecord::Schema.define(version: 20140806212436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name",                       null: false
    t.string   "genre",                      null: false
    t.string   "contact_name",               null: false
    t.string   "contact_phone",              null: false
    t.string   "bio",           default: "", null: false
    t.string   "soundcloud",    default: "", null: false
    t.string   "twitter",       default: "", null: false
    t.string   "facebook",      default: "", null: false
    t.string   "youtube",       default: "", null: false
    t.string   "myspace",       default: "", null: false
    t.string   "beatport",      default: "", null: false
    t.string   "tumblr",        default: "", null: false
    t.string   "website",       default: "", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "concerts", force: true do |t|
    t.date     "date",                         null: false
    t.string   "event_name",      default: "", null: false
    t.integer  "headliner_id",                 null: false
    t.string   "tickets",         default: "", null: false
    t.string   "additional_info", default: "", null: false
    t.integer  "venue_id",                     null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "fans", force: true do |t|
    t.string   "name",       null: false
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
    t.integer  "account_id"
    t.string   "account_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name",                      null: false
    t.string   "address",                   null: false
    t.string   "city",                      null: false
    t.string   "state",                     null: false
    t.string   "phone",                     null: false
    t.string   "contact_name",              null: false
    t.integer  "capacity",                  null: false
    t.string   "notes",        default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "venues", ["name"], name: "index_venues_on_name", unique: true, using: :btree

end
