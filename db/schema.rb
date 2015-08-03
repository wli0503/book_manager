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

ActiveRecord::Schema.define(version: 20150803133810) do

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "DOB"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "name"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.integer  "subgenre_id"
    t.integer  "publisher_id"
    t.float    "price"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id", using: :btree
  add_index "books", ["subgenre_id"], name: "index_books_on_subgenre_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.integer  "book_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.float    "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_details", ["book_id"], name: "index_order_details_on_book_id", using: :btree
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.float    "total_price"
    t.string   "customer_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_name"], name: "index_orders_on_customer_name", using: :btree

  create_table "price_histories", force: true do |t|
    t.integer  "book_id"
    t.float    "old_price"
    t.float    "new_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_histories", ["book_id"], name: "index_price_histories_on_book_id", using: :btree

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subgenres", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "genre_id"
  end

  add_index "subgenres", ["genre_id"], name: "index_subgenres_on_genre_id", using: :btree

end
