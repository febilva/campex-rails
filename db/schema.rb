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

ActiveRecord::Schema.define(version: 20160512033225) do

  create_table "boards", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "subject_structure", limit: 255
    t.boolean  "disabled"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

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

  create_table "districts", force: :cascade do |t|
    t.integer  "state_id",   limit: 4
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "districts", ["state_id"], name: "fk_rails_61da3337c8", using: :btree

  create_table "guardians", force: :cascade do |t|
    t.integer  "student_id",       limit: 4
    t.string   "name",             limit: 255
    t.string   "gender",           limit: 255
    t.string   "email",            limit: 255
    t.string   "mobile_no",        limit: 255
    t.string   "phone_no",         limit: 255
    t.string   "relationship",     limit: 255
    t.integer  "qualification_id", limit: 4
    t.integer  "occupation_id",    limit: 4
    t.string   "annual_income",    limit: 255
    t.string   "address_line1",    limit: 255
    t.string   "address_line2",    limit: 255
    t.integer  "country_id",       limit: 4
    t.integer  "state_id",         limit: 4
    t.integer  "district_id",      limit: 4
    t.string   "taluk",            limit: 255
    t.string   "post_office",      limit: 255
    t.string   "pincode",          limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "same_address"
  end

  add_index "guardians", ["country_id"], name: "index_guardians_on_country_id", using: :btree
  add_index "guardians", ["district_id"], name: "index_guardians_on_district_id", using: :btree
  add_index "guardians", ["occupation_id"], name: "index_guardians_on_occupation_id", using: :btree
  add_index "guardians", ["qualification_id"], name: "index_guardians_on_qualification_id", using: :btree
  add_index "guardians", ["state_id"], name: "index_guardians_on_state_id", using: :btree
  add_index "guardians", ["student_id"], name: "index_guardians_on_student_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "student_id",        limit: 4
    t.integer  "stream_subject_id", limit: 4
    t.string   "grade",             limit: 255
    t.integer  "score",             limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "subject_position",  limit: 4
  end

  add_index "marks", ["stream_subject_id"], name: "index_marks_on_stream_subject_id", using: :btree
  add_index "marks", ["student_id"], name: "index_marks_on_student_id", using: :btree

  create_table "occupations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "programmes", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "programme_type",   limit: 255
    t.boolean  "entrance"
    t.boolean  "self_finance"
    t.integer  "intake",           limit: 4
    t.string   "indexing_rules",   limit: 255
    t.string   "ranking_priority", limit: 255
    t.integer  "general",          limit: 4
    t.integer  "sc",               limit: 4
    t.integer  "st",               limit: 4
    t.integer  "muslim",           limit: 4
    t.integer  "handicapped",      limit: 4
    t.integer  "obc",              limit: 4
    t.integer  "obh",              limit: 4
    t.integer  "etb",              limit: 4
    t.integer  "latin",            limit: 4
    t.boolean  "disabled"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "name",       limit: 255
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

  create_table "states", force: :cascade do |t|
    t.integer  "country_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "states", ["country_id"], name: "fk_rails_40bd891262", using: :btree

  create_table "stream_subjects", force: :cascade do |t|
    t.integer  "stream_id",  limit: 4
    t.string   "name",       limit: 255
    t.integer  "part",       limit: 4
    t.integer  "max_marks",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stream_subjects", ["stream_id"], name: "fk_rails_a72ea78f16", using: :btree

  create_table "streams", force: :cascade do |t|
    t.integer  "board_id",   limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "streams", ["board_id"], name: "fk_rails_fad1b1fd6c", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "email",                   limit: 255
    t.string   "name",                    limit: 255
    t.string   "gender",                  limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "aadhar_no",               limit: 255
    t.string   "mobile_no",               limit: 255
    t.string   "phone_no",                limit: 255
    t.string   "blood_group",             limit: 255
    t.string   "dob",                     limit: 255
    t.string   "religion",                limit: 255
    t.integer  "reservation_category_id", limit: 4
    t.integer  "caste_id",                limit: 4
    t.integer  "nationality_id",          limit: 4
    t.string   "birth_place",             limit: 255
    t.string   "born_in",                 limit: 255
    t.string   "address_line1",           limit: 255
    t.string   "address_line2",           limit: 255
    t.string   "post_office",             limit: 255
    t.string   "taluk",                   limit: 255
    t.integer  "district_id",             limit: 4
    t.integer  "state_id",                limit: 4
    t.integer  "country_id",              limit: 4
    t.string   "pincode",                 limit: 255
    t.string   "comm_address_line1",      limit: 255
    t.string   "comm_address_line2",      limit: 255
    t.string   "comm_post_office",        limit: 255
    t.string   "comm_taluk",              limit: 255
    t.integer  "comm_district_id",        limit: 4
    t.integer  "comm_state_id",           limit: 4
    t.integer  "comm_country_id",         limit: 4
    t.string   "comm_pincode",            limit: 255
    t.boolean  "blind"
    t.boolean  "deaf"
    t.boolean  "orthopedic"
    t.boolean  "ex_service"
    t.boolean  "nss"
    t.string   "ncc",                     limit: 255
    t.boolean  "arts"
    t.boolean  "sports"
    t.integer  "no_of_chances",           limit: 4
    t.boolean  "illiteracy_eradication"
    t.boolean  "same_address"
    t.integer  "board_id",                limit: 4
    t.integer  "stream_id",               limit: 4
    t.integer  "tenth_yos",               limit: 4
    t.integer  "tenth_yop",               limit: 4
    t.string   "tenth_regno",             limit: 255
    t.string   "tenth_institution",       limit: 255
    t.integer  "twelfth_yos",             limit: 4
    t.integer  "twelfth_yop",             limit: 4
    t.string   "twelfth_regno",           limit: 255
    t.string   "twelfth_institution",     limit: 255
    t.string   "twelfth_tc_no",           limit: 255
    t.string   "twelfth_tc_date",         limit: 255
  end

  add_index "students", ["board_id"], name: "index_students_on_board_id", using: :btree
  add_index "students", ["caste_id"], name: "index_students_on_caste_id", using: :btree
  add_index "students", ["comm_district_id"], name: "index_students_on_comm_district_id", using: :btree
  add_index "students", ["comm_state_id"], name: "index_students_on_comm_state_id", using: :btree
  add_index "students", ["country_id"], name: "index_students_on_country_id", using: :btree
  add_index "students", ["district_id"], name: "index_students_on_district_id", using: :btree
  add_index "students", ["nationality_id"], name: "index_students_on_nationality_id", using: :btree
  add_index "students", ["reservation_category_id"], name: "index_students_on_reservation_category_id", using: :btree
  add_index "students", ["state_id"], name: "index_students_on_state_id", using: :btree
  add_index "students", ["stream_id"], name: "index_students_on_stream_id", using: :btree

  add_foreign_key "castes", "reservation_categories"
  add_foreign_key "districts", "states"
  add_foreign_key "guardians", "countries"
  add_foreign_key "guardians", "districts"
  add_foreign_key "guardians", "occupations"
  add_foreign_key "guardians", "qualifications"
  add_foreign_key "guardians", "states"
  add_foreign_key "guardians", "students"
  add_foreign_key "marks", "stream_subjects"
  add_foreign_key "marks", "students"
  add_foreign_key "registration_forms", "students"
  add_foreign_key "states", "countries"
  add_foreign_key "stream_subjects", "streams"
  add_foreign_key "streams", "boards"
  add_foreign_key "students", "castes"
  add_foreign_key "students", "countries"
  add_foreign_key "students", "districts"
  add_foreign_key "students", "reservation_categories"
  add_foreign_key "students", "states"
end
