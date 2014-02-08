class Picture < ActiveRecord::Base
	attr_accessible :title, :caption, :image, :rotation, :link, :album_id

	belongs_to :album

	has_attached_file :image, :styles => { :small => "150x150>", :medium => "200x300>", :large => "500x500>", :xlarge => "800x800>", :xxlarge => "1000x1000>" },
	                  :url  => "/albums/:album_id/:class/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/albums/:album_id/:class/:id/:style/:basename.:extension",
	                  :processors => [:rotator]

	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 6.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
	
	attr_accessor :rotate

	before_create :set_defaults

  def rotate!(degrees = 90)
		logger.info "Rotation is: #{self.rotation} and degrees is #{degrees}"
		self.rotation += degrees
		logger.info "Rotation is: #{self.rotation}"
		self.rotation -= 360 if self.rotation >= 360
		self.rotation += 360 if self.rotation <= -360
    
		self.rotate = true
		self.image.reprocess!
		self.save
  end
  
  def rotating?
    !self.rotation.nil? and self.rotate
  end

  def valid_sizes
    return [:small, :medium, :large, :xlarge, :xxlarge, :original]
  end

  private
  def set_defaults
    self.rotation ||= 0
  end
end
