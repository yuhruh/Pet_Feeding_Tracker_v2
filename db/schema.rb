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

ActiveRecord::Schema[8.0].define(version: 2025_05_14_130324) do
  create_table "pets", force: :cascade do |t|
    t.string "pet_name"
    t.datetime "birthday"
    t.decimal "weight"
    t.string "gender"
    t.string "breed"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.integer "pet_id"
    t.date "date"
    t.time "feeding_time"
    t.string "time_of_eat_back_and_forth"
    t.string "type"
    t.string "brand"
    t.string "description"
    t.decimal "amount", precision: 5, scale: 2
    t.decimal "left_amount", precision: 5, scale: 2
    t.integer "favorite_score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "time_zone"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
