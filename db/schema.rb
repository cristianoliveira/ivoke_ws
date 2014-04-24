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

ActiveRecord::Schema.define(version: 20140423003517) do

  create_table "mural_posts", force: true do |t|
    t.integer  "usuario_id"
    t.string   "from"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "message"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mural_posts", ["usuario_id"], name: "index_mural_posts_on_usuario_id"

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
