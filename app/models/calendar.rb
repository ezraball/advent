class Calendar < ActiveRecord::Base
  attr_accessible :name, :pub_date, :background, :end_date, :days_to_count_down
  
  has_many :entries
  has_attached_file :background, 
    :storage => :s3,
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
    :bucket => 'advent-dev'
  
  validates_presence_of :name, :pub_date, :end_date, :days_to_count_down
end
