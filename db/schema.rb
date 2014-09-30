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

ActiveRecord::Schema.define(version: 20140609022028) do

  create_table "conversation_messages", force: true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "message"
    t.integer  "time"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversation_messages", ["conversation_id"], name: "index_conversation_messages_on_conversation_id", using: :btree
  add_index "conversation_messages", ["user_id"], name: "index_conversation_messages_on_user_id", using: :btree

  create_table "conversations", force: true do |t|
    t.integer  "user_one_id"
    t.integer  "user_two_id"
    t.integer  "time"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["user_one_id"], name: "index_conversations_on_user_one_id", using: :btree
  add_index "conversations", ["user_two_id"], name: "index_conversations_on_user_two_id", using: :btree

  create_table "debugs", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.text     "message"
    t.text     "suggestion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "google_devices", force: true do |t|
    t.integer  "user_id"
    t.string   "registration_id"
    t.integer  "acept_notification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "google_devices", ["user_id"], name: "index_google_devices_on_user_id", using: :btree

  create_table "log_errors", force: true do |t|
    t.string   "report_id"
    t.string   "app_version_name"
    t.string   "android_version"
    t.string   "phone_model"
    t.text     "stack_trace"
    t.text     "setting_global"
    t.text     "shared_preferences"
    t.string   "brand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mural_posts", force: true do |t|
    t.integer  "user_id"
    t.decimal  "latitude",                 precision: 10, scale: 6
    t.decimal  "longitude",                precision: 10, scale: 6
    t.text     "message"
    t.integer  "anonymous"
    t.string   "place_id",   limit: 10000,                          default: "null"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mural_posts", ["latitude", "longitude"], name: "index_mural_posts_on_latitude_and_longitude", using: :btree
  add_index "mural_posts", ["user_id"], name: "index_mural_posts_on_user_id", using: :btree

  create_table "places", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.text     "description"
    t.string   "adress"
    t.string   "phone"
    t.string   "url_profile_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "gender",      limit: 10
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_localizacaos", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "latitude"
    t.integer  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuario_localizacaos", ["usuario_id"], name: "index_usuario_localizacaos_on_usuario_id", using: :btree

end
