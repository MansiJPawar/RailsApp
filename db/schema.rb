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

ActiveRecord::Schema.define(version: 2022_04_04_090739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facebook_accounts", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.string "username"
    t.string "image"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_facebook_accounts_on_account_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "image"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "age"
    t.boolean "gender"
    t.bigint "phone"
    t.string "uid"
    t.string "provider"
    t.boolean "is_active", default: true
    t.boolean "is_block", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.text "profile_image"
    t.string "last_name"
    t.bigint "phone_no"
    t.integer "age"
    t.boolean "gender"
    t.string "address"
    t.string "name"
    t.text "image"
    t.boolean "deactivated"
    t.string "avatar"
    t.string "job_profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "facebook_accounts", "accounts"
end
