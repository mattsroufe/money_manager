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

ActiveRecord::Schema.define(version: 20130629232032) do

  create_table "transactions", force: true do |t|
    t.string   "trans_type",  limit: 20
    t.string   "details",     limit: 40
    t.string   "particulars", limit: 20
    t.string   "code",        limit: 20
    t.string   "reference",   limit: 20
    t.decimal  "amount",                 precision: 10, scale: 2
    t.string   "string_date", limit: 10
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
