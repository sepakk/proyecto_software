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

ActiveRecord::Schema.define(version: 20161103202355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crop_cycles", force: :cascade do |t|
    t.integer  "crop_id"
    t.integer  "cycle_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.date     "time"
    t.boolean  "is_started", default: false
    t.index ["crop_id"], name: "index_crop_cycles_on_crop_id", using: :btree
    t.index ["cycle_id"], name: "index_crop_cycles_on_cycle_id", using: :btree
  end

  create_table "crops", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_crops_on_plant_id", using: :btree
    t.index ["user_id"], name: "index_crops_on_user_id", using: :btree
  end

  create_table "cycles", force: :cascade do |t|
    t.integer  "plant_id"
    t.text     "desc"
    t.integer  "time"
    t.integer  "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["plant_id"], name: "index_cycles_on_plant_id", using: :btree
  end

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plagues", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plant_diseases", force: :cascade do |t|
    t.integer  "plant_id"
    t.integer  "disease_id"
    t.text     "treatment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_plant_diseases_on_disease_id", using: :btree
    t.index ["plant_id"], name: "index_plant_diseases_on_plant_id", using: :btree
  end

  create_table "plant_plagues", force: :cascade do |t|
    t.integer  "plant_id"
    t.integer  "plague_id"
    t.text     "treatment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plague_id"], name: "index_plant_plagues_on_plague_id", using: :btree
    t.index ["plant_id"], name: "index_plant_plagues_on_plant_id", using: :btree
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "reminders", force: :cascade do |t|
    t.text     "desc"
    t.datetime "time"
    t.integer  "crop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crop_id"], name: "index_reminders_on_crop_id", using: :btree
  end

  create_table "steps", force: :cascade do |t|
    t.text     "desc"
    t.integer  "cycle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cycle_id"], name: "index_steps_on_cycle_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.boolean  "isadmin",                default: true
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "crop_cycles", "crops"
  add_foreign_key "crop_cycles", "cycles"
  add_foreign_key "crops", "plants"
  add_foreign_key "crops", "users"
  add_foreign_key "cycles", "plants"
  add_foreign_key "plant_diseases", "diseases"
  add_foreign_key "plant_diseases", "plants"
  add_foreign_key "plant_plagues", "plagues"
  add_foreign_key "plant_plagues", "plants"
  add_foreign_key "reminders", "crops"
  add_foreign_key "steps", "cycles"
end
