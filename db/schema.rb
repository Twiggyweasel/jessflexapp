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

ActiveRecord::Schema.define(version: 2021_02_05_031657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "simple_desc"
    t.string "detail_desc"
    t.integer "location"
    t.integer "category"
    t.integer "set_label"
    t.boolean "has_weight"
    t.boolean "machine_based"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_activities_on_name", unique: true
  end

  create_table "machine_activities", force: :cascade do |t|
    t.bigint "machine_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_machine_activities_on_activity_id"
    t.index ["machine_id"], name: "index_machine_activities_on_machine_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plan_users", force: :cascade do |t|
    t.date "purchase_date"
    t.boolean "referral", default: false
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_plan_users_on_plan_id"
    t.index ["user_id"], name: "index_plan_users_on_user_id"
  end

  create_table "plan_workouts", force: :cascade do |t|
    t.boolean "previewable", default: false
    t.bigint "plan_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_plan_workouts_on_plan_id"
    t.index ["workout_id"], name: "index_plan_workouts_on_workout_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "status", default: 0
    t.integer "price"
    t.integer "difficulty", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "variations", force: :cascade do |t|
    t.integer "difficulty"
    t.integer "weight"
    t.integer "set"
    t.integer "rep"
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_variations_on_activity_id"
  end

  create_table "workout_activities", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "variation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["variation_id"], name: "index_workout_activities_on_variation_id"
    t.index ["workout_id"], name: "index_workout_activities_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "bundle_only", default: true
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "machine_activities", "activities"
  add_foreign_key "machine_activities", "machines"
  add_foreign_key "plan_users", "plans"
  add_foreign_key "plan_users", "users"
  add_foreign_key "plan_workouts", "plans"
  add_foreign_key "plan_workouts", "workouts"
  add_foreign_key "variations", "activities"
  add_foreign_key "workout_activities", "variations"
  add_foreign_key "workout_activities", "workouts"
end
