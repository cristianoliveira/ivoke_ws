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

ActiveRecord::Schema.define(version: 20140513035421) do

  create_table "conversation_messages", force: true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "message"
    t.integer  "time"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversation_messages", ["conversation_id"], name: "index_conversation_messages_on_conversation_id"
  add_index "conversation_messages", ["user_id"], name: "index_conversation_messages_on_user_id"

  create_table "conversations", force: true do |t|
    t.integer  "user_one_id"
    t.integer  "user_two_id"
    t.integer  "time"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["user_one_id"], name: "index_conversations_on_user_one_id"
  add_index "conversations", ["user_two_id"], name: "index_conversations_on_user_two_id"

  create_table "debugs", force: true do |t|
    t.string   "message"
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

  add_index "google_devices", ["user_id"], name: "index_google_devices_on_user_id"

  create_table "mural_posts", force: true do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mural_posts", ["user_id"], name: "index_mural_posts_on_user_id"

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

  add_index "usuario_localizacaos", ["usuario_id"], name: "index_usuario_localizacaos_on_usuario_id"

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
