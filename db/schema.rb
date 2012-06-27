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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120618010612) do

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "post_number"
    t.integer  "user_id"
    t.integer  "rank",               :default => 0
    t.integer  "parent_post_number"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "posts", ["user_id", "rank"], :name => "index_posts_on_user_id_and_rank"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "is_admin",        :default => false
    t.string   "remember_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
