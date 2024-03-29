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

ActiveRecord::Schema.define(:version => 20120105052454) do

  create_table "dash_boards", :force => true do |t|
    t.integer  "gift_receiver_id"
    t.string   "log_in_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gift_groups", :force => true do |t|
    t.integer  "gift_receiver_id"
    t.string   "email"
    t.integer  "shareamount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "gift_receivers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "occassion"
    t.date     "senddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
    t.string   "imgurl"
    t.float    "coast"
  end

  create_table "gift_selecteds", :force => true do |t|
    t.integer  "gift_receiver_id"
    t.string   "asin"
    t.string   "imgurl"
    t.string   "title"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "gift_receiver_id"
    t.integer  "gift_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "payed"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "gift_group_id"
    t.integer  "gift_receiver_id"
    t.integer  "gift_selected_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
