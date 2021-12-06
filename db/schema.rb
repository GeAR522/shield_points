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

ActiveRecord::Schema.define(version: 2021_12_03_161346) do

  create_table "devs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_devs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_devs_on_reset_password_token", unique: true
  end

  create_table "points", force: :cascade do |t|
    t.string "user"
    t.string "github_url"
    t.integer "point_total"
    t.datetime "create_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "point_id"
    t.integer "review_subtotal"
    t.integer "testing_subtotal"
    t.integer "housekeeping_subtotal"
    t.integer "productivity_subtotal"
    t.integer "meta_subtotal"
    t.datetime "created_at", null: false
  end

  create_table "quests", force: :cascade do |t|
    t.integer "total_points"
    t.integer "review_total"
    t.integer "testing_total"
    t.integer "housekeeping_total"
    t.integer "productivity_total"
    t.integer "meta_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_quests_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "automate_or_die"
    t.integer "twenty_first_century_digital_boy"
    t.integer "questions_id"
    t.integer "subtotal"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "total_points"
    t.integer "total_prs"
    t.integer "dev_id"
    t.index ["dev_id"], name: "index_users_on_dev_id"
  end

end
