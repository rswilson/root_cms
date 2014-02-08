class MenuItem < ActiveRecord::Base
	attr_accessible :name, :parent_id, :menu_id, :position, :link_id, :folder_id, :override_link

	belongs_to :menu
	has_one :parent, :class_name => "MenuItem", :foreign_key => "id", :primary_key => "parent_id"
	has_many :children, :class_name => "MenuItem", :foreign_key => "parent_id", :primary_key => "id", :order => "position"

	has_one :page, :class_name => "Page", :foreign_key => "id", :primary_key => "link_id"
	has_one :link, :through => :page
	belongs_to :folder

	validates_presence_of :name, :menu_id
	
	#acts_as_list :scope => :parent_id
	#acts_as_tree :order => "position"

	def number_of_children
			return self.children.size
	end

	def class_name
		return self.name.downcase.gsub(/ /, "_")
	end
	
	def url
		if self.override_link.nil? || self.override_link == ""
			return self.page.url
		else
			return self.override_link
		end
	end
end
