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

ActiveRecord::Schema.define(version: 20140913021504) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "image_path"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.integer  "updated_by_id"
    t.datetime "updated_at"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.text     "notes"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "image_path"
    t.integer  "company_id"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.integer  "updated_by_id"
    t.datetime "updated_at"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.text     "notes"
  end

  add_index "customers", ["company_id"], name: "index_customers_on_company_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "file_path"
    t.string   "file_name"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.integer  "updated_by_id"
    t.datetime "updated_at"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.text     "notes"
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id"

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "project_id"
    t.integer  "customer_id"
    t.string   "design_document"
    t.datetime "from"
    t.datetime "until"
    t.string   "case"
    t.string   "case_link"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.integer  "updated_by_id"
    t.datetime "updated_at"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.text     "notes"
  end

  add_index "tasks", ["company_id"], name: "index_tasks_on_company_id"
  add_index "tasks", ["customer_id"], name: "index_tasks_on_customer_id"
  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"

  create_table "users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "role",                   limit: 5
    t.boolean  "super_admin"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.integer  "updated_by_id"
    t.datetime "updated_at"
    t.integer  "deleted_by_id"
    t.datetime "approved_at"
    t.integer  "approved_by_id"
    t.datetime "deleted_at"
    t.text     "notes"
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
