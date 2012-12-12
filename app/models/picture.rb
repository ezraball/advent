class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :picturefile
  before_save :set_dimensions
  
  scope :unassigned, -> {where(" id not in (select picture_id from entries) ")}

  has_many :entries
  has_many :songs, :through => :entries
  has_attached_file :picturefile, 
    :styles => { :full => "600x600>", :medium => "300x300>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
    :bucket => 'advent-dev'
    
    
  def set_dimensions
    tempfile = self.picturefile.queued_for_write[:original]
    unless tempfile.nil?
      dimensions = Paperclip::Geometry.from_file(tempfile)
      self.width = dimensions.width
      self.height = dimensions.height
    end
  end

end
