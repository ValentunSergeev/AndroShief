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

ActiveRecord::Schema.define(version: 20170205052808) do

  create_table "admins", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email"
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_recipies", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "recipy_id"
  end

  add_index "categories_recipies", ["category_id"], name: "index_categories_recipies_on_category_id"
  add_index "categories_recipies", ["recipy_id"], name: "index_categories_recipies_on_recipy_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "cookbooks", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cookbooks", ["user_id"], name: "index_cookbooks_on_user_id"

  create_table "cookbooks_recipies", id: false, force: :cascade do |t|
    t.integer "cookbook_id"
    t.integer "recipy_id"
  end

  add_index "cookbooks_recipies", ["cookbook_id"], name: "index_cookbooks_recipies_on_cookbook_id"
  add_index "cookbooks_recipies", ["recipy_id"], name: "index_cookbooks_recipies_on_recipy_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipies", id: false, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipy_id"
  end

  add_index "ingredients_recipies", ["ingredient_id"], name: "index_ingredients_recipies_on_ingredient_id"
  add_index "ingredients_recipies", ["recipy_id"], name: "index_ingredients_recipies_on_recipy_id"

  create_table "recipies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "main_photo"
    t.integer  "likes_count",   default: 0
    t.integer  "cook_time"
    t.integer  "calories"
    t.integer  "proteins"
    t.integer  "fats"
    t.integer  "carbohydrates"
  end

  add_index "recipies", ["user_id"], name: "index_recipies_on_user_id"

  create_table "steps", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image"
    t.integer  "recipy_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "timer"
  end

  add_index "steps", ["recipy_id"], name: "index_steps_on_recipy_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "small_image"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
