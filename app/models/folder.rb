class Folder < ActiveRecord::Base
	attr_accessible :name, :parent_id
	has_one :folder, :class_name => "Folder", :foreign_key => "id", :primary_key => "parent_id"
	has_many :sub_folders, :class_name => "Folder", :foreign_key => "parent_id", :primary_key => "id"
	has_many :pages
	validates_presence_of :name

	def path
		if self.folder.nil?
			@path = "#{self.name}"
		else
			@path = "#{self.folder.path}/#{self.name}"
		end
		return @path
	end

	def is_child_of (folder)
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
	
	def has_children?
		if self.sub_folders.size == 0
			return false
		else
			return true
		end
	end
end
