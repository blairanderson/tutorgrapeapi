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

ActiveRecord::Schema.define(:version => 20130602050324) do

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "lattitude"
    t.string   "longitude"
    t.string   "age"
    t.string   "photo"
    t.string   "job_title"
    t.boolean  "tutor"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "activation_key"
    t.integer  "user_id"
    t.string   "email"
    t.string   "corporation"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "requester_id"
    t.integer  "subject_id"
    t.integer  "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "requests", ["requester_id"], :name => "index_requests_on_requester_id"
  add_index "requests", ["state"], :name => "index_requests_on_state"
  add_index "requests", ["subject_id"], :name => "index_requests_on_subject_id"
  add_index "requests", ["user_id"], :name => "index_requests_on_user_id"

  create_table "subject_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subject_users", ["level"], :name => "index_subject_users_on_level"
  add_index "subject_users", ["subject_id"], :name => "index_subject_users_on_subject_id"
  add_index "subject_users", ["user_id"], :name => "index_subject_users_on_user_id"

  create_table "subjects", :force => true do |t|
    t.string   "topic"
    t.string   "sub_topic"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
