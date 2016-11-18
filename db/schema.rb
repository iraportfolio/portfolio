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

ActiveRecord::Schema.define(version: 20161118141048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string  "title",                         null: false
    t.boolean "is_published",   default: true, null: false
    t.integer "weight",         default: 0
    t.text    "description"
    t.string  "title_ua"
    t.text    "description_ua"
  end

  add_index "albums", ["is_published"], name: "index_albums_on_is_published", using: :btree
  add_index "albums", ["title"], name: "index_albums_on_title", unique: true, using: :btree
  add_index "albums", ["weight"], name: "index_albums_on_weight", using: :btree

  create_table "image_tags", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_tags", ["image_id", "tag_id"], name: "index_image_tags_on_image_id_and_tag_id", unique: true, using: :btree
  add_index "image_tags", ["image_id"], name: "index_image_tags_on_image_id", using: :btree
  add_index "image_tags", ["tag_id"], name: "index_image_tags_on_tag_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "album_id"
    t.string   "asset"
    t.string   "title"
    t.string   "place"
    t.text     "desc"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.string   "tags_cache"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "title_ua"
    t.string   "place_ua"
    t.text     "desc_ua"
  end

  add_index "images", ["album_id"], name: "index_images_on_album_id", using: :btree
  add_index "images", ["published_at"], name: "index_images_on_published_at", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "asset"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "weight",       default: 0,     null: false
    t.boolean  "is_cover",     default: false, null: false
    t.text     "desc_ua"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",                              null: false
    t.boolean  "is_published",   default: true,      null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight",         default: 0,         null: false
    t.text     "info"
    t.string   "title_ua"
    t.text     "description_ua"
    t.text     "info_ua"
    t.string   "type",           default: "project", null: false
  end

  add_index "projects", ["is_published"], name: "index_projects_on_is_published", using: :btree
  add_index "projects", ["weight"], name: "index_projects_on_weight", using: :btree

  create_table "rss_records", force: :cascade do |t|
    t.string   "owner_type", null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rss_records", ["created_at"], name: "index_rss_records_on_created_at", using: :btree
  add_index "rss_records", ["owner_type", "owner_id"], name: "index_rss_records_on_owner_type_and_owner_id", unique: true, using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "env",                      default: "development",                           null: false
    t.string   "host",                     default: "http://0.0.0.0:3000"
    t.string   "title",                    default: "Username Portfolio"
    t.string   "description",              default: "Username Portfolio - Photo & Art work"
    t.string   "copyright_holder",         default: "Developer"
    t.string   "flickr_user_id",           default: "Nickname"
    t.string   "google_analytics_account", default: "UA-000000-00"
    t.string   "linkedin_account",         default: "http://linkedin.com/"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contact_text"
    t.text     "contact_text_ua"
    t.string   "facebook_account"
    t.string   "instagram_account"
    t.integer  "title_image_id"
    t.string   "title_image_title"
  end

  add_index "settings", ["env"], name: "index_settings_on_env", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
