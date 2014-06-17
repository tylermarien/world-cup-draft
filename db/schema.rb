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

ActiveRecord::Schema.define(version: 20140617053639) do

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id"
    t.string   "logo"
    t.string   "group"
    t.integer  "group_rank"
    t.integer  "group_points"
    t.integer  "matches_played"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "draws"
    t.integer  "goals_for"
    t.integer  "goals_against"
  end

  create_table "countries_teams", id: false, force: true do |t|
    t.integer "country_id"
    t.integer "team_id"
  end

  create_table "goals", force: true do |t|
    t.integer  "match_id"
    t.integer  "country_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["country_id"], name: "index_goals_on_country_id"
  add_index "goals", ["match_id"], name: "index_goals_on_match_id"
  add_index "goals", ["player_id"], name: "index_goals_on_player_id"

  create_table "matches", force: true do |t|
    t.datetime "occurs_at"
    t.integer  "home_id"
    t.integer  "away_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "played"
  end

  add_index "matches", ["away_id"], name: "index_matches_on_away_id"
  add_index "matches", ["home_id"], name: "index_matches_on_home_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id"
    t.string   "image"
    t.integer  "goals"
    t.integer  "own_goals"
    t.integer  "penalty_goals"
  end

  add_index "players", ["country_id"], name: "index_players_on_country_id"

  create_table "players_teams", id: false, force: true do |t|
    t.integer "player_id"
    t.integer "team_id"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
