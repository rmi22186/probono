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

ActiveRecord::Schema.define(version: 20140825204723) do

  create_table "apartments", force: true do |t|
    t.string   "unit"
    t.float    "bedrooms"
    t.float    "bathrooms"
    t.string   "floorplan"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unique_id"
    t.integer  "building_id"
  end

  add_index "apartments", ["building_id"], name: "index_apartments_on_building_id"

  create_table "buildings", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "string"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "maintenance_comments", force: true do |t|
    t.integer  "maintenance_request_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maintenance_comments", ["maintenance_request_id"], name: "index_maintenance_comments_on_maintenance_request_id"
  add_index "maintenance_comments", ["user_id"], name: "index_maintenance_comments_on_user_id"

  create_table "maintenance_requests", force: true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "priority"
    t.string   "description"
    t.boolean  "email_updates"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "maintenance_requests", ["user_id"], name: "index_maintenance_requests_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                          default: "",       null: false
    t.string   "encrypted_password",             default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                  default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.string   "emergency_contact_relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                           default: "tenant", null: false
    t.boolean  "active"
    t.boolean  "approved",                       default: false,    null: false
    t.string   "apartment_validation"
    t.integer  "apartment_id"
  end

  add_index "users", ["apartment_id"], name: "index_users_on_apartment_id"
  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
