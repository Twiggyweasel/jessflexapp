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

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "exercises", force: :cascade do |t|
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
    t.index ["name"], name: "index_exercises_on_name", unique: true
  end

  create_table "machine_exercises", force: :cascade do |t|
    t.bigint "machine_id", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_machine_exercises_on_exercise_id"
    t.index ["machine_id"], name: "index_machine_exercises_on_machine_id"
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

  create_table "series", force: :cascade do |t|
    t.integer "set", null: false
    t.integer "rep", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_series_on_exercise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variations", force: :cascade do |t|
    t.text "description"
    t.integer "weight"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_variations_on_exercise_id"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "difficulty"
    t.bigint "workout_id", null: false
    t.bigint "exercise_id", null: false
    t.bigint "variation_id", null: false
    t.bigint "series_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["series_id"], name: "index_workout_exercises_on_series_id"
    t.index ["variation_id"], name: "index_workout_exercises_on_variation_id"
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.integer "duration", default: 10
    t.integer "difficulty", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "machine_exercises", "exercises"
  add_foreign_key "machine_exercises", "machines"
  add_foreign_key "plan_users", "plans"
  add_foreign_key "plan_users", "users"
  add_foreign_key "plan_workouts", "plans"
  add_foreign_key "plan_workouts", "workouts"
  add_foreign_key "series", "exercises"
  add_foreign_key "variations", "exercises"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "series"
  add_foreign_key "workout_exercises", "variations"
  add_foreign_key "workout_exercises", "workouts"
end
