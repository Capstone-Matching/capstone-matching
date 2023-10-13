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

ActiveRecord::Schema[7.0].define(version: 2023_10_13_135143) do
  create_table "classes_new", force: :cascade do |t|
    t.integer "class_id"
    t.integer "professor_id"
    t.string "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "email"
    t.string "semester", default: "{}"
    t.string "section", default: "{}"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin_approved", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors_new", force: :cascade do |t|
    t.integer "professor_id"
    t.boolean "admin"
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "Semester"
    t.string "Name"
    t.string "Sponsor"
    t.text "Description"
    t.string "Link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_new", force: :cascade do |t|
    t.integer "project_id"
    t.string "project_name"
    t.string "description"
    t.string "sponsor"
    t.integer "class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores_attributes_new", force: :cascade do |t|
    t.integer "attribute_id"
    t.string "feature_name"
    t.float "feature_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores_entities_new", force: :cascade do |t|
    t.integer "scores_id"
    t.integer "student_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores_values_new", force: :cascade do |t|
    t.integer "scores_id"
    t.integer "attribute_id"
    t.float "feature_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_forms", force: :cascade do |t|
    t.string "email"
    t.string "last_name"
    t.string "first_name"
    t.integer "uin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_new", force: :cascade do |t|
    t.integer "student_id"
    t.integer "class_id"
    t.integer "uin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_new", force: :cascade do |t|
    t.integer "user_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
