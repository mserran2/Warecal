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

ActiveRecord::Schema.define(:version => 20120204034814) do

  create_table "assigments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shift_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigments", ["shift_id"], :name => "index_assigments_on_shift_id"
  add_index "assigments", ["user_id"], :name => "index_assigments_on_user_id"

  create_table "shifts", :force => true do |t|
    t.integer  "template_id"
    t.date     "date"
    t.integer  "start"
    t.integer  "end"
    t.boolean  "canceled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shifts", ["template_id"], :name => "index_shifts_on_template_id"

  create_table "sub_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shift_id"
    t.boolean  "filled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_requests", ["shift_id"], :name => "index_sub_requests_on_shift_id"
  add_index "sub_requests", ["user_id"], :name => "index_sub_requests_on_user_id"

  create_table "templates", :force => true do |t|
    t.string   "day"
    t.integer  "start"
    t.integer  "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "phone"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "lastlog"
    t.boolean  "opt_out"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
