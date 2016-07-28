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

ActiveRecord::Schema.define(version: 20160728111731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "order_id"
    t.integer  "cart_id"
    t.string   "full_name_bill"
    t.string   "address_bill"
    t.string   "city_bill"
    t.string   "region_bill"
    t.string   "zip_bill"
    t.string   "country_bill"
    t.string   "phone_bill"
  end

  add_index "bills", ["cart_id"], name: "index_bills_on_cart_id", using: :btree
  add_index "bills", ["order_id"], name: "index_bills_on_order_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "size"
    t.integer  "quantity"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country"
    t.decimal  "delivery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "full_name"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.integer  "cart_id"
  end

  add_index "deliveries", ["cart_id"], name: "index_deliveries_on_cart_id", using: :btree
  add_index "deliveries", ["order_id"], name: "index_deliveries_on_order_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "product_id"
    t.boolean  "default"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "size"
    t.string   "color"
    t.integer  "quantity"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "order_id"
    t.string   "brand"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "picture"
    t.boolean  "onSale",             default: false
    t.decimal  "sale_price"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "delivery_id"
    t.integer  "bill_id"
  end

  add_index "orders", ["bill_id"], name: "index_orders_on_bill_id", using: :btree
  add_index "orders", ["delivery_id"], name: "index_orders_on_delivery_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id", using: :btree
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted"
    t.integer  "brand_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "picture"
    t.boolean  "onSale",             default: false
    t.decimal  "sale_price"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "firstName"
    t.string   "lastName"
    t.datetime "created_at"
    t.boolean  "admin"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.string   "remember_token"
  end

  create_table "variants", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.integer  "color_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "variants", ["color_id"], name: "index_variants_on_color_id", using: :btree
  add_index "variants", ["product_id"], name: "index_variants_on_product_id", using: :btree
  add_index "variants", ["size_id"], name: "index_variants_on_size_id", using: :btree

  add_foreign_key "bills", "carts"
  add_foreign_key "bills", "orders"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "deliveries", "carts"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "images", "products"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "bills"
  add_foreign_key "orders", "deliveries"
  add_foreign_key "orders", "users"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "variants", "colors"
  add_foreign_key "variants", "products"
  add_foreign_key "variants", "sizes"
end
