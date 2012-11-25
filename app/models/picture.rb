class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :picturefile

  has_many :entries
  has_many :songs, :through => :entries
  has_attached_file :picturefile, 
    :styles => { :full => "600x600>", :medium => "300x300>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
    :bucket => 'advent-dev'
    
    

end
