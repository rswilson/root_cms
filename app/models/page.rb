class Page < ActiveRecord::Base
	version_fu
	
	attr_accessible :page_template_id, :name, :title, :content, :filename, :folder_id, :start_page, :version
	attr_accessor :final_content, :url, :admin_url, :start_page

	belongs_to :page_template
	belongs_to :folder
	belongs_to :site

	has_many :menu_items

	validates_presence_of :name, :title, :filename
	#validates_uniqueness_of :url

	def url
		if self.folder.nil?
			@url = "/#{self.filename}"
		else
			@url = "/#{self.folder.path}/#{self.filename}"
		end
		return @url
	end

	def admin_url
		return "#{self.name} - #{self.url}"
	end

	def is_child_of(folder)
		logger.info "Checking folders: #{self.name}"
		if folder.nil?
			return false
		end
		logger.info "Checking folders: #{self.name} against folder #{folder.name}"
		if self.folder.nil?
			return false
		else
			if self.folder == folder
				return true
			else
				return self.folder.is_child_of folder
			end
		end
	end
end
