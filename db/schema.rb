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

ActiveRecord::Schema.define(version: 20170122165014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attached_events_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attached_events_users_on_event_id", using: :btree
    t.index ["user_id"], name: "index_attached_events_users_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_documents_on_event_id", using: :btree
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "place"
    t.datetime "time"
    t.datetime "end_time"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.string   "token"
    t.string   "email"
    t.integer  "event_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "index_invites_on_event_id", using: :btree
    t.index ["recipient_id"], name: "index_invites_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_invites_on_sender_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "invite_id"
    t.integer  "event_id"
    t.integer  "attached_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["creator_id"], name: "index_notifications_on_creator_id", using: :btree
    t.index ["event_id", "attached_user_id"], name: "index_notifications_on_event_id_and_attached_user_id", unique: true, using: :btree
    t.index ["event_id"], name: "index_notifications_on_event_id", using: :btree
    t.index ["invite_id"], name: "index_notifications_on_invite_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
