class PageTemplate < ActiveRecord::Base
	attr_accessible :name, :content, :header_content, :default_template
	attr_accessor :default_template

	has_many :pages
	has_many :blogs

	validates_presence_of :name, :content
	belongs_to :site

	validate :check_tags?

	def check_tags?
		logger.info "Checking tags before saving"
		if !(self.content =~ /#CONTENT#/)
			logger.info "No CONTENT tag found"
			errors.add("content", "You have not defined a #CONTENT# tag. Please amend.")
		end
	end
end
