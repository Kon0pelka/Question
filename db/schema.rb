# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180511074616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.integer "questions_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questions_category_id"], name: "index_categories_on_questions_category_id"
  end

  create_table "questions_categories", force: :cascade do |t|
    t.integer "questions_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_categories_on_category_id"
    t.index ["questions_id", "category_id"], name: "index_questions_categories_on_questions_id_and_category_id", unique: true
    t.index ["questions_id"], name: "index_questions_categories_on_questions_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255
    t.string "nick", limit: 50
    t.string "password", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nick"], name: "index_users_on_nick", unique: true
  end

end
