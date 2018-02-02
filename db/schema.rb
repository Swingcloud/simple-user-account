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

ActiveRecord::Schema.define(version: 20180202075753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "card_number"
    t.string "name"
    t.string "status"
    t.decimal "balance"
    t.boolean "livemode", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "uid"
    t.index ["uid"], name: "index_accounts_on_uid"
  end

  create_table "payments", force: :cascade do |t|
    t.string "demo"
    t.string "name"
    t.string "status"
    t.decimal "amount"
    t.string "currency"
    t.text "description"
    t.string "merchant_name"
    t.string "category"
    t.boolean "refunded"
    t.decimal "account_balance"
    t.string "request_longitude"
    t.string "request_latitude"
    t.string "request_address"
    t.string "network_type"
    t.string "network_ip"
    t.string "netwrok_operator"
    t.string "wireless_access_point"
    t.boolean "livemode", default: true
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.index ["uid"], name: "index_payments_on_uid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "telephone_number"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "password_digest"
    t.index ["uid"], name: "index_users_on_uid"
  end

end
