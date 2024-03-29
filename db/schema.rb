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

ActiveRecord::Schema[7.0].define(version: 2023_12_12_152209) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completed_tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "sphere"
    t.text "description"
    t.string "answer_1"
    t.string "answer_2"
    t.string "answer_3"
    t.integer "answer_1_cost"
    t.integer "answer_2_cost"
    t.integer "answer_3_cost"
    t.boolean "agreed", default: false, null: false
    t.integer "creater"
    t.boolean "test", default: false, null: false
    t.integer "task_class"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "login"
    t.string "date"
    t.string "password_digest"
    t.boolean "superuser", default: false, null: false
    t.integer "rating", default: 0
    t.integer "balance", default: 0
    t.string "current_sphere", default: "speech"
    t.integer "speech", default: 0
    t.integer "productivity", default: 0
    t.integer "sleep", default: 0
    t.integer "nutrition", default: 0
    t.boolean "tested", default: false, null: false
    t.integer "secret_number"
  end

end
