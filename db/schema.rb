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

ActiveRecord::Schema.define(version: 20170706163654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "todo_items", force: :cascade do |t|
    t.text     "description"
    t.string   "summary"
    t.datetime "due_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "todo_list_id"
    t.integer  "status",       default: 0
    t.integer  "user_id"
    t.integer  "asignee_id"
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id", using: :btree
    t.index ["user_id"], name: "index_todo_items_on_user_id", using: :btree
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_lists_users", id: false, force: :cascade do |t|
    t.integer "todo_list_id", null: false
    t.integer "user_id",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "user_type"
    t.date     "dob"
    t.string   "ice_cream"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "todo_items", "users"
end
