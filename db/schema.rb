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

ActiveRecord::Schema.define(version: 20180302021342) do

  create_table "line_items", force: :cascade do |t|
    t.text "menu_item_id"
    t.integer "tray_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.index ["menu_item_id"], name: "index_line_items_on_menu_item_id"
    t.index ["tray_id"], name: "index_line_items_on_tray_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.text "menu_item_id"
    t.string "kind"
    t.string "name"
    t.text "description"
    t.integer "stock_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "tray_id"
    t.text "components"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "status", default: "pending"
    t.index ["tray_id"], name: "index_orders_on_tray_id"
  end

  create_table "trays", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
