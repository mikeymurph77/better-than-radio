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

ActiveRecord::Schema.define(version: 20140821140404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name",                         null: false
    t.string   "genre",                        null: false
    t.string   "contact_name",                 null: false
    t.string   "contact_phone",                null: false
    t.string   "bio",             default: "", null: false
    t.string   "soundcloud",      default: "", null: false
    t.string   "twitter",         default: "", null: false
    t.string   "facebook",        default: "", null: false
    t.string   "youtube",         default: "", null: false
    t.string   "myspace",         default: "", null: false
    t.string   "beatport",        default: "", null: false
    t.string   "tumblr",          default: "", null: false
    t.string   "website",         default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "profile_picture"
    t.string   "video_id",        default: "", null: false
  end

  create_table "comments", force: true do |t|
    t.integer  "fan_id",           null: false
    t.string   "body",             null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["fan_id"], name: "index_comments_on_fan_id", using: :btree

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
    t.string   "name",            null: false
    t.string   "location",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "profile_picture"
  end

  create_table "opening_acts", force: true do |t|
    t.integer  "artist_id"
    t.integer  "concert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: true do |t|
    t.integer  "fan_id",      null: false
    t.integer  "concert_id",  null: false
    t.string   "description", null: false
    t.string   "image",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "photos", ["concert_id"], name: "index_photos_on_concert_id", using: :btree
  add_index "photos", ["fan_id"], name: "index_photos_on_fan_id", using: :btree

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "rsvps", force: true do |t|
    t.integer  "fan_id",     null: false
    t.integer  "concert_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rsvps", ["concert_id"], name: "index_rsvps_on_concert_id", using: :btree
  add_index "rsvps", ["fan_id", "concert_id"], name: "index_rsvps_on_fan_id_and_concert_id", unique: true, using: :btree
  add_index "rsvps", ["fan_id"], name: "index_rsvps_on_fan_id", using: :btree

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
    t.string   "name",                         null: false
    t.string   "address",                      null: false
    t.string   "city",                         null: false
    t.string   "state",                        null: false
    t.string   "phone",                        null: false
    t.string   "contact_name",                 null: false
    t.integer  "capacity",                     null: false
    t.string   "notes",           default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "profile_picture"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "venues", ["name"], name: "index_venues_on_name", unique: true, using: :btree

end
