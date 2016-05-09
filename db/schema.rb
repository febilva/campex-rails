# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160509081338) do

  create_table "castes", force: :cascade do |t|
    t.integer  "reservation_category_id", limit: 4
    t.string   "name",                    limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "castes", ["reservation_category_id"], name: "fk_rails_cb6b8cb67a", using: :btree

  create_table "configurators", force: :cascade do |t|
    t.integer  "max_enabled_step", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "registration_forms", force: :cascade do |t|
    t.integer  "student_id",        limit: 4
    t.integer  "current_step",      limit: 4
    t.boolean  "instructions_read"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "registration_forms", ["student_id"], name: "index_registration_forms_on_student_id", using: :btree

  create_table "registration_steps", force: :cascade do |t|
    t.integer  "position",   limit: 4
    t.string   "name",       limit: 255
    t.string   "icon",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "controller", limit: 255
    t.string   "action",     limit: 255
  end

  create_table "reservation_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "name",       limit: 255
    t.string   "gender",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "castes", "reservation_categories"
  add_foreign_key "registration_forms", "students"
end
