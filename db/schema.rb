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

ActiveRecord::Schema.define(version: 20180707112651) do

  create_table "loyality_points", force: :cascade do |t|
    t.string "email"
    t.float "balance_points"
    t.string "first_name"
    t.string "last_name"
    t.integer "provided_customer_id"
    t.integer "provided_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.index ["shop_id"], name: "index_loyality_points_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "{:index=>true}_id"
    t.integer "points_per_spent", default: 1
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
    t.index ["{:index=>true}_id"], name: "index_shops_on_{:index=>true}_id"
  end

end
