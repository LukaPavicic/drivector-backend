# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_06_232759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_joined_vtcs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vtc_id"
    t.integer "permissions", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_joined_vtcs_on_user_id"
    t.index ["vtc_id"], name: "index_user_joined_vtcs_on_vtc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "tmp_profile_link", default: "", null: false
    t.string "steam_profile_link", default: "", null: false
    t.integer "jobs_completed", default: 0, null: false
    t.integer "money_earned", default: 0, null: false
    t.string "favorite_truck_brand", default: "", null: false
    t.string "current_vtc", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vtcs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "user_id"
    t.text "description", default: "", null: false
    t.integer "money_made", default: 0, null: false
    t.integer "deliveries_completed", default: 0, null: false
    t.integer "minimum_age_to_join", default: 1, null: false
    t.string "main_color", default: "#27ae60", null: false
    t.integer "total_km_driven", default: 0, null: false
    t.integer "member_count", default: 0, null: false
    t.integer "pricing_plan", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vtcs_on_user_id"
  end

  add_foreign_key "user_joined_vtcs", "users"
  add_foreign_key "user_joined_vtcs", "vtcs"
  add_foreign_key "vtcs", "users"
end
