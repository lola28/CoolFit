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

ActiveRecord::Schema.define(version: 2019_05_30_144143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "fitness_level"
    t.string "location"
    t.datetime "time"
    t.integer "duration"
    t.integer "price"
    t.text "description"
    t.bigint "category_id"
    t.string "photo_db"
    t.string "photo_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
    t.string "name"
    t.bigint "user_id"
    t.index ["category_id"], name: "index_activities_on_category_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_bookings_on_activity_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
  end

  create_table "health_relations", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "health_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_health_relations_on_activity_id"
    t.index ["health_id"], name: "index_health_relations_on_health_id"
  end

  create_table "healths", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_interests_on_activity_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.bigint "user_id"
    t.index ["activity_id"], name: "index_messages_on_activity_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "age"
    t.string "physical_activity"
    t.text "description"
    t.boolean "professional"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "categories"
  add_foreign_key "activities", "users"
  add_foreign_key "bookings", "activities"
  add_foreign_key "bookings", "users"
  add_foreign_key "health_relations", "activities"
  add_foreign_key "health_relations", "healths"
  add_foreign_key "interests", "activities"
  add_foreign_key "interests", "users"
  add_foreign_key "messages", "activities"
  add_foreign_key "messages", "users"
end
