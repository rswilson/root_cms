class Site < ActiveRecord::Base
	attr_accessible :name, :url, :contact_address, :global_title, :default_template

	has_one :start_page, :class_name => "Page", :foreign_key => "id", :primary_key => "start_page_id"
	has_one :default_template, :class_name => "PageTemplate", :foreign_key => "id", :primary_key => "default_template_id"
	has_many :pages

	validates_presence_of :name, :url
	validates_format_of :contact_address,
	 :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

	def validate
		#if self.id.nil?
		#	if !Site.find(:first).nil?
		#		errors.add_to_base("You can only have one site defined, please edit this site instead of creating a new one")
		#	end
		#else
		#	if !Site.find(:first, :conditions => ["id != ?", self.id]).nil?
		#		errors.add_to_base("You can only have one site defined, please edit this site instead of creating a new one")
		#	end
		#end
	end
	
	def folders
		return Folder.all
	end


end
