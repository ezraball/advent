class Movie < ActiveRecord::Base
  attr_accessible :name, :embed_code, :width

  has_many :entries

end
