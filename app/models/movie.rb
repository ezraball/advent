class Movie < ActiveRecord::Base
  attr_accessible :name, :embed_code, :width

  has_many :entries
  
  scope :unassigned, -> {where(' id not in (select movie_id from entries)')}

end
