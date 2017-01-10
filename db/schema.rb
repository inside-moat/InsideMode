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

ActiveRecord::Schema.define(version: 20170106000357) do

  create_table "blogs", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "title",      limit: 65535
    t.text     "content",    limit: 65535
  end
ActiveRecord::Schema.define(version: 20170109234220) do

  create_table "facebooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.text     "title",      limit: 65535
    t.datetime "runtime"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

<<<<<<< HEAD
  create_table "facebooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.text     "title",      limit: 65535
    t.datetime "runtime"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
=======
  create_table "news", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.string   "source",       limit: 255
    t.date     "published_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
>>>>>>> 0c0c3a4fbb5d45b77ae3b7c6e311ee3662e41e3f
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.date     "published_on"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
<<<<<<< HEAD
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.date     "published_on"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
>>>>>>> 0c0c3a4fbb5d45b77ae3b7c6e311ee3662e41e3f
  end

end
