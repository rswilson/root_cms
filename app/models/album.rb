class Album < ActiveRecord::Base
	attr_accessible :name, :title, :description, :gallery_id, :thumbnail_size, :lightbox_size

	has_many :pictures, :dependent => :destroy
	belongs_to :gallery

	validates_presence_of :name
	
	before_create :set_defaults
	before_save :set_defaults
	
	private
  def set_defaults
    self.thumbnail_size ||= :small
    self.lightbox_size ||= :large
  end
end
