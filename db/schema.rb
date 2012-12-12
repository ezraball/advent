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

ActiveRecord::Schema.define(:version => 20121202185751) do

  create_table "calendars", :force => true do |t|
    t.string   "name"
    t.date     "pub_date"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.date     "end_date"
    t.integer  "days_to_count_down"
  end

  create_table "entries", :force => true do |t|
    t.integer  "calendar_id"
    t.integer  "song_id"
    t.integer  "picture_id"
    t.integer  "movie_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "day"
    t.integer  "x"
    t.integer  "y"
  end

  add_index "entries", ["calendar_id"], :name => "index_entries_on_calendar_id"
  add_index "entries", ["movie_id"], :name => "index_entries_on_movie_id"
  add_index "entries", ["picture_id"], :name => "index_entries_on_picture_id"
  add_index "entries", ["song_id"], :name => "index_entries_on_song_id"

  create_table "movies", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "embed_code"
    t.string   "name"
    t.integer  "width"
  end

  create_table "pairings", :force => true do |t|
    t.integer  "calendar_id"
    t.integer  "song_id"
    t.integer  "picture_id"
    t.integer  "movie_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pairings", ["calendar_id", "song_id", "movie_id", "picture_id"], :name => "pairings_everything_idx"
  add_index "pairings", ["calendar_id"], :name => "index_pairings_on_calendar_id"
  add_index "pairings", ["movie_id"], :name => "index_pairings_on_movie_id"
  add_index "pairings", ["picture_id"], :name => "index_pairings_on_picture_id"
  add_index "pairings", ["song_id"], :name => "index_pairings_on_song_id"

  create_table "pictures", :force => true do |t|
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "picturefile_file_name"
    t.string   "picturefile_content_type"
    t.integer  "picturefile_file_size"
    t.datetime "picturefile_updated_at"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "songs", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "songfile_file_name"
    t.string   "songfile_content_type"
    t.integer  "songfile_file_size"
    t.datetime "songfile_updated_at"
    t.string   "artist"
    t.string   "title"
  end

end
