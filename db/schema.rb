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

ActiveRecord::Schema[7.0].define(version: 2023_01_11_123502) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "ird_no"
    t.string "name"
    t.string "address"
    t.string "entity_type"
    t.string "activity_status"
    t.integer "paye_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxpayers", force: :cascade do |t|
    t.integer "ird_no"
    t.string "old_ird_no"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "address"
    t.string "entity_type"
    t.string "active_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
  end

end