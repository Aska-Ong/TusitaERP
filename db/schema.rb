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

ActiveRecord::Schema.define(version: 20131206024852) do

  create_table "branches", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.boolean  "state",      default: true
    t.integer  "position",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "signed_up"
    t.integer  "attended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.decimal  "amount"
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fund_id"
  end

  create_table "finances", force: true do |t|
    t.decimal  "amount"
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "state",        default: true
    t.integer  "topics_count", default: 0
    t.integer  "posts_count",  default: 0
    t.integer  "position",     default: 0
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funds", force: true do |t|
    t.string   "type"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_number"
  end

  create_table "minutes", force: true do |t|
    t.string   "content"
    t.date     "date"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", force: true do |t|
    t.integer  "count"
    t.integer  "branch_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.integer  "hits",        default: 0
    t.boolean  "sticky",      default: false
    t.boolean  "locked",      default: false
    t.integer  "posts_count"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transits", force: true do |t|
    t.string   "passenger_name"
    t.date     "date_departure"
    t.date     "date_arrival"
    t.string   "sector"
    t.string   "flight_no"
    t.string   "terminal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transports", force: true do |t|
    t.integer  "transit_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "topics_count",    default: 0
    t.integer  "posts_count",     default: 0
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
