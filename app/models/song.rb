class Song < ActiveRecord::Base
  attr_accessible :artist, :title, :songfile
  
  has_attached_file :songfile, 
    :storage => :s3,
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
    :bucket => 'advent-dev'
  
  has_many :entries
  scope :unassigned, -> {where( ' id not in (select song_id from entries)')}
  def label
    [artist,title].join('|')
  end
end
