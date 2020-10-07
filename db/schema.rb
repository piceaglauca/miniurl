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

ActiveRecord::Schema.define(version: 2020_10_07_230644) do

  create_table "ips", force: :cascade do |t|
    t.string "ip"
    t.integer "num_visits"
    t.integer "mini_url_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mini_url_id"], name: "index_ips_on_mini_url_id"
  end

  create_table "mini_urls", force: :cascade do |t|
    t.string "short_url"
    t.text "full_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_url"], name: "index_mini_urls_on_short_url"
  end

end