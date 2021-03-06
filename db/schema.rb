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

ActiveRecord::Schema.define(version: 20140531222255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "route_points", force: true do |t|
    t.integer  "route_id"
    t.spatial  "point",      limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "route_points", ["route_id"], :name => "index_route_points_on_route_id"

  create_table "routes", force: true do |t|
    t.spatial  "start",      limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.spatial  "end",        limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.spatial  "current",    limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes_users", ["route_id"], :name => "index_routes_users_on_route_id"
  add_index "routes_users", ["user_id"], :name => "index_routes_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "token"
    t.integer  "current_route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["current_route_id"], :name => "index_users_on_current_route_id"

end
