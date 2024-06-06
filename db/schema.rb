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

ActiveRecord::Schema[7.1].define(version: 2024_06_06_182937) do
  create_table "course_modules", force: :cascade do |t|
    t.integer "year_id", null: false
    t.string "title"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_course_modules_on_year_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "CourseModule_id", null: false
    t.string "title"
    t.integer "weight"
    t.decimal "achieved", precision: 10, scale: 2
    t.integer "out_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["CourseModule_id"], name: "index_tests_on_CourseModule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_years_on_user_id"
  end

  add_foreign_key "course_modules", "years"
  add_foreign_key "tests", "CourseModules"
  add_foreign_key "years", "users"
end
