# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_02_205605) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "operation_type"
    t.integer "usd_price"
    t.integer "pen_prince"
    t.integer "maintanence"
    t.string "photos"
    t.string "videos"
    t.integer "view_counter"
    t.integer "favorites_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_advertisements_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "advertisement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_favorites_on_advertisement_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "department"
    t.string "province"
    t.string "district"
    t.string "urbanization"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_locations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "type"
    t.string "subtype"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "restorooms"
    t.integer "parking_lots"
    t.float "total_area"
    t.float "built_area"
    t.integer "antiquity"
    t.bigint "advertisement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_properties_on_advertisement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "dni"
    t.string "phone_number"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "token_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token", "token_created_at"], name: "index_users_on_token_and_token_created_at"
  end

  add_foreign_key "advertisements", "users"
  add_foreign_key "favorites", "advertisements"
  add_foreign_key "favorites", "users"
  add_foreign_key "locations", "properties"
  add_foreign_key "properties", "advertisements"
end
