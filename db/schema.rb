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

ActiveRecord::Schema.define(version: 20170913100733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "image"
    t.bigint "user_in_group_id"
    t.index ["user_in_group_id"], name: "index_activities_on_user_in_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "size_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_invites_on_group_id"
    t.index ["token"], name: "index_invites_on_token"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "user_in_groups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "owner", default: false
    t.index ["group_id"], name: "index_user_in_groups_on_group_id"
    t.index ["user_id"], name: "index_user_in_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "gender"
    t.text "picture"
    t.string "locale"
    t.string "facebook_id"
    t.string "facebook_link"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
