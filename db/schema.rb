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

ActiveRecord::Schema.define(:version => 20121018041807) do

  create_table "conversations", :force => true do |t|
    t.string   "key"
    t.integer  "person_id"
    t.integer  "user_id"
    t.integer  "inbound_message_id"
    t.boolean  "active",             :default => true
    t.integer  "status",             :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "inbound_messages", :force => true do |t|
    t.integer  "person_id"
    t.integer  "conversation_id"
    t.string   "request_type"
    t.string   "message"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "key"
    t.integer  "conversation_id"
    t.string   "from_type"
    t.string   "from_id"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "phone"
    t.string   "key"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "blocked"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "phone"
    t.boolean  "available"
    t.boolean  "approved"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
