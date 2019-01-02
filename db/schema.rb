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

ActiveRecord::Schema.define(version: 14) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "username", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admin_users_on_username", unique: true
  end

  create_table "discussion_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "discussion_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussion_id"], name: "index_discussion_comments_on_discussion_id"
    t.index ["user_id"], name: "index_discussion_comments_on_user_id"
  end

  create_table "discussion_upvotes", force: :cascade do |t|
    t.bigint "discussion_id", null: false
    t.bigint "voter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussion_id"], name: "index_discussion_upvotes_on_discussion_id"
    t.index ["voter_id"], name: "index_discussion_upvotes_on_voter_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "paper_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_discussions_on_paper_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "paper_difficulties", force: :cascade do |t|
    t.bigint "paper_id", null: false
    t.integer "rate"
    t.bigint "rater_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_paper_difficulties_on_paper_id"
    t.index ["rater_id"], name: "index_paper_difficulties_on_rater_id"
  end

  create_table "paper_feedbacks", force: :cascade do |t|
    t.bigint "paper_id", null: false
    t.integer "feedback"
    t.bigint "provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_paper_feedbacks_on_paper_id"
    t.index ["provider_id"], name: "index_paper_feedbacks_on_provider_id"
  end

  create_table "paper_reports", force: :cascade do |t|
    t.bigint "paper_id", null: false
    t.string "report"
    t.bigint "reporter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_paper_reports_on_paper_id"
    t.index ["reporter_id"], name: "index_paper_reports_on_reporter_id"
  end

  create_table "papers", force: :cascade do |t|
    t.string "year", null: false
    t.string "month", null: false
    t.string "annual", null: false
    t.string "prof_name", null: false
    t.string "duration", null: false
    t.boolean "open_book", default: false, null: false
    t.boolean "open_network", default: false, null: false
    t.bigint "user_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.bigint "document_file_size"
    t.datetime "document_updated_at"
    t.index ["subject_id"], name: "index_papers_on_subject_id"
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "cs_required"
    t.boolean "im_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_subjects_on_code", unique: true
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "user_reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "report"
    t.bigint "reporter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reporter_id"], name: "index_user_reports_on_reporter_id"
    t.index ["user_id"], name: "index_user_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "title", null: false
    t.string "name", null: false
    t.string "user_type", null: false
    t.string "email", null: false
    t.integer "score", default: 50, null: false
    t.boolean "banned", default: false, null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "discussion_comments", "discussions"
  add_foreign_key "discussion_comments", "users"
  add_foreign_key "discussion_upvotes", "discussions"
  add_foreign_key "discussion_upvotes", "users", column: "voter_id"
  add_foreign_key "discussions", "papers"
  add_foreign_key "discussions", "users"
  add_foreign_key "paper_difficulties", "papers"
  add_foreign_key "paper_difficulties", "users", column: "rater_id"
  add_foreign_key "paper_feedbacks", "papers"
  add_foreign_key "paper_feedbacks", "users", column: "provider_id"
  add_foreign_key "paper_reports", "papers"
  add_foreign_key "paper_reports", "users", column: "reporter_id"
  add_foreign_key "papers", "subjects"
  add_foreign_key "papers", "users"
  add_foreign_key "user_reports", "users"
  add_foreign_key "user_reports", "users", column: "reporter_id"
end
