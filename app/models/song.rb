class Song < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :entries
end
