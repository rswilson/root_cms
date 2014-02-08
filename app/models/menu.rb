class Menu < ActiveRecord::Base
	attr_accessible :name

	has_many :menu_items, :dependent => :destroy
	has_many :root, :class_name => "MenuItem", :foreign_key => "menu_id", :primary_key => "id", :conditions => {:parent_id => nil}, :order => "position"

	validates_presence_of :name

	def number_of_children
		return self.root.size
	end

end
