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

ActiveRecord::Schema.define(version: 20140729132230) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "addresses", force: true do |t|
    t.string   "street_address"
    t.string   "street_address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", force: true do |t|
    t.integer  "debit_group_id"
    t.string   "status"
    t.date     "sent_date"
    t.string   "delivery_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debit_groups", force: true do |t|
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debits", force: true do |t|
    t.integer  "rent_amount"
    t.integer  "status",                      default: 0
    t.integer  "debit_group_id"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.string   "balanced_id"
    t.string   "balanced_href"
    t.string   "balanced_transaction_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "street_address"
    t.text     "payment_notes"
    t.string   "memo"
    t.decimal  "rent_amount"
    t.boolean  "separate_checks"
    t.date     "first_payment_date"
    t.date     "final_payment_date"
    t.integer  "company_id"
    t.integer  "payment_address_id"
    t.string   "city"
    t.string   "invite_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invites", force: true do |t|
    t.string   "email"
    t.decimal  "rent"
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_methods", force: true do |t|
    t.integer  "user_id"
    t.string   "balanced_bank_name"
    t.string   "balanced_account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recurring_payments", force: true do |t|
    t.decimal  "rent_amount"
    t.string   "memo"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "payment_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_groups", force: true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

end
