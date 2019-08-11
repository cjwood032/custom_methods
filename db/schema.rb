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

ActiveRecord::Schema.define(version: 3) do

  create_table "mephods", force: :cascade do |t|
    t.text    "mephodname"
    t.integer "user_id"
    t.text    "language"
    t.text    "description"
    t.text    "mephod_data"
    t.integer "tag_id"
    t.text    "tag"
  end

  create_table "tags", force: :cascade do |t|
    t.text    "name"
    t.integer "mephod_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text   "email"
    t.string "password_digest"
  end

end
