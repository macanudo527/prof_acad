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

ActiveRecord::Schema.define(version: 20160620015717) do

  create_table "answer_stats", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "correct_answer"
    t.integer  "a2"
    t.integer  "a3"
    t.integer  "a4"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "answer_stats", ["question_id"], name: "index_answer_stats_on_question_id"

  create_table "groupings", force: :cascade do |t|
    t.string   "name"
    t.integer  "test_id"
    t.integer  "per_page"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "groupings", ["test_id"], name: "index_groupings_on_test_id"
  add_index "groupings", ["user_id"], name: "index_groupings_on_user_id"

  create_table "question_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.text     "correct_answer"
    t.text     "a2"
    t.text     "a3"
    t.text     "a4"
    t.integer  "reference"
    t.integer  "reference_type"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "grouping_id"
    t.integer  "question_type_id"
  end

  add_index "questions", ["grouping_id"], name: "index_questions_on_grouping_id"
  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id"
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
