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

ActiveRecord::Schema.define(version: 20151006194003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "travelers", force: :cascade do |t|
    t.string   "name",                 default: "", null: false
    t.string   "phone",                default: "", null: false
    t.string   "email",                default: "", null: false
    t.string   "otp_secret_key"
    t.integer  "otp_counter"
    t.string   "encrypted_password",   default: "", null: false
    t.string   "authentication_token"
    t.string   "device_token"
    t.string   "push_token",           default: "", null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "travelers", ["authentication_token"], name: "index_travelers_on_authentication_token", unique: true, using: :btree
  add_index "travelers", ["device_token"], name: "index_travelers_on_device_token", unique: true, using: :btree

end
