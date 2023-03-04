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

ActiveRecord::Schema.define(version: 2023_03_03_041348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id"
    t.string "title", default: ""

    t.decimal "witch_points", precision: 10, scale: 2
    t.decimal "wizard_points", precision: 10, scale: 2
    t.decimal "lepracaun_points", precision: 10, scale: 2
    t.decimal "dragon_points", precision: 10, scale: 2
    t.decimal "human_points", precision: 10, scale: 2
    t.decimal "elf_points", precision: 10, scale: 2
    t.decimal "fairy_points", precision: 10, scale: 2
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "picture_options", force: :cascade do |t|
    t.bigint "question_id"
    t.decimal "witch_points", precision: 10, scale: 2
    t.decimal "wizard_points", precision: 10, scale: 2
    t.decimal "lepracaun_points", precision: 10, scale: 2
    t.decimal "dragon_points", precision: 10, scale: 2
    t.decimal "human_points", precision: 10, scale: 2
    t.decimal "elf_points", precision: 10, scale: 2
    t.decimal "fairy_points", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_picture_options_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "description", default: "", null: false
    t.index ["title"], name: "index_questionnaires_on_title"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.string "title", default: "", null: false
    t.integer "question_type", default: 0
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "range_options", force: :cascade do |t|
    t.decimal "min_range"
    t.decimal "max_range"
    t.decimal "witch_percentage", precision: 10, scale: 2
    t.decimal "wizard_percentage", precision: 10, scale: 2
    t.decimal "lepracaun_percentage", precision: 10, scale: 2
    t.decimal "dragon_percentage", precision: 10, scale: 2
    t.decimal "human_percentage", precision: 10, scale: 2
    t.decimal "elf_percentage", precision: 10, scale: 2
    t.decimal "fairy_percentage", precision: 10, scale: 2
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_range_options_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["confirmed_at"], name: "index_users_on_confirmed_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "options", "questions"
  add_foreign_key "picture_options", "questions"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "range_options", "questions"
end
