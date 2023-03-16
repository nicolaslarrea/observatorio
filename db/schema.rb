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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_235625) do
  create_table "courses", force: :cascade do |t|
    t.string "number"
    t.string "day"
    t.string "starts_at"
    t.string "ends_at"
    t.string "kind"
    t.string "teacher"
    t.integer "vacancy"
    t.string "mandatory"
    t.string "classroom"
    t.string "observations"
    t.integer "semester_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scrap_id", null: false
    t.index ["scrap_id"], name: "index_courses_on_scrap_id"
    t.index ["semester_id"], name: "index_courses_on_semester_id"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scraps", force: :cascade do |t|
    t.integer "number"
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_scraps_on_semester_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "year"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "chair"
    t.integer "degree_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_subjects_on_degree_id"
  end

  add_foreign_key "courses", "scraps"
  add_foreign_key "courses", "semesters"
  add_foreign_key "courses", "subjects"
  add_foreign_key "scraps", "semesters"
  add_foreign_key "subjects", "degrees"
end
