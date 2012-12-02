class Entry < ActiveRecord::Base
  attr_accessible :calendar_id, :movie_id, :picture_id, :song_id, :day, :calendar, :movie, :picture, :song, :x, :y
  
  belongs_to :calendar
  belongs_to :song
  belongs_to :picture
  belongs_to :movie
  
  def unlocked?(debug = false)
    debug || (self.day < (self.calendar.days_to_count_down - (self.calendar.end_date - Date.today).to_i))
  end
  
end
