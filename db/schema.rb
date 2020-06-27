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

ActiveRecord::Schema.define(version: 2020_06_10_173343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "charges", force: :cascade do |t|
    t.integer "user_id"
    t.integer "amount"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.string "stripe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "card_brand"
    t.index ["stripe_id"], name: "index_charges_on_stripe_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "description", default: "", null: false
    t.datetime "start_time", null: false
    t.bigint "user_id"
    t.bigint "vtc_id"
    t.string "start_city", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["vtc_id"], name: "index_events_on_vtc_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vtc_id"
    t.integer "money_made", default: 0, null: false
    t.integer "km_driven", default: 0, null: false
    t.string "goods_type", default: "", null: false
    t.string "from_city", default: "", null: false
    t.string "to_city", default: "", null: false
    t.string "from_company", default: "", null: false
    t.string "to_company", default: "", null: false
    t.float "damage", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
    t.index ["vtc_id"], name: "index_jobs_on_vtc_id"
  end

  create_table "join_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vtc_id"
    t.integer "status", default: 0, null: false
    t.text "rejection_message", default: "", null: false
    t.text "motivation_text", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_join_requests_on_user_id"
    t.index ["vtc_id"], name: "index_join_requests_on_vtc_id"
  end

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
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.string "card_last4"
    t.integer "card_expiration_month"
    t.integer "card_expiration_year"
    t.string "card_brand"
    t.integer "subscription_type", default: 0, null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pricing_plan", default: 0, null: false
    t.integer "maximum_amount_of_users", default: 10, null: false
    t.string "twitter_link", default: "", null: false
    t.string "facebook_link", default: "", null: false
    t.string "discord_link", default: "", null: false
    t.string "instagram_link", default: "", null: false
    t.string "youtube_link", default: "", null: false
    t.string "twitch_link", default: "", null: false
    t.index ["user_id"], name: "index_vtcs_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "users"
  add_foreign_key "events", "vtcs"
  add_foreign_key "jobs", "users"
  add_foreign_key "jobs", "vtcs"
  add_foreign_key "join_requests", "users"
  add_foreign_key "join_requests", "vtcs"
  add_foreign_key "user_joined_vtcs", "users"
  add_foreign_key "user_joined_vtcs", "vtcs"
  add_foreign_key "vtcs", "users"
end
