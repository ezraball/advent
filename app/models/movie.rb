class Movie < ActiveRecord::Base
  attr_accessible :youtube_url

  has_many :entries

end
