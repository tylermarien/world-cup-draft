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

ActiveRecord::Schema.define(version: 20140713181928) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id",       limit: 255
    t.string   "logo",         limit: 255
    t.integer  "group_rank",   limit: 4
    t.integer  "group_points", limit: 4
    t.integer  "group_id",     limit: 4
    t.integer  "final_rank",   limit: 4
  end

  add_index "countries", ["group_id"], name: "index_countries_on_group_id", using: :btree

  create_table "countries_teams", id: false, force: :cascade do |t|
    t.integer "country_id", limit: 4
    t.integer "team_id",    limit: 4
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "occurs_at"
    t.integer  "home_id",             limit: 4
    t.integer  "away_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id",              limit: 255
    t.integer  "home_score",          limit: 4
    t.integer  "away_score",          limit: 4
    t.string   "status",              limit: 255
    t.integer  "home_shootout_score", limit: 4
    t.integer  "away_shootout_score", limit: 4
  end

  add_index "matches", ["away_id"], name: "index_matches_on_away_id", using: :btree
  add_index "matches", ["home_id"], name: "index_matches_on_home_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "country_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id",         limit: 255
    t.string   "image",          limit: 255
    t.integer  "goals",          limit: 4
    t.integer  "own_goals",      limit: 4
    t.integer  "penalty_goals",  limit: 4
    t.integer  "shootout_goals", limit: 4
  end

  add_index "players", ["country_id"], name: "index_players_on_country_id", using: :btree

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4
    t.integer "team_id",   limit: 4
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
