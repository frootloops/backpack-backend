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

ActiveRecord::Schema.define(version: 20151006201759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "devices", force: :cascade do |t|
    t.integer  "traveler_id"
    t.string   "name"
    t.string   "uuid"
    t.string   "access_token"
    t.string   "push_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "devices", ["access_token"], name: "index_devices_on_access_token", unique: true, using: :btree
  add_index "devices", ["push_token"], name: "index_devices_on_push_token", unique: true, using: :btree
  add_index "devices", ["traveler_id"], name: "index_devices_on_traveler_id", using: :btree
  add_index "devices", ["uuid"], name: "index_devices_on_uuid", unique: true, using: :btree

  create_table "travelers", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile_number"
    t.string   "email"
    t.string   "otp_secret_key"
    t.integer  "otp_counter"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "travelers", ["mobile_number"], name: "index_travelers_on_mobile_number", unique: true, using: :btree

  add_foreign_key "devices", "travelers"
end
