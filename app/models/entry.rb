class Entry < ActiveRecord::Base
  attr_accessible :calendar_id, :movie_id, :picture_id, :song_id, :unlock_date, :calendar, :movie, :picture, :song
  
  belongs_to :calendar
  belongs_to :song
  belongs_to :picture
  belongs_to :movie
end
