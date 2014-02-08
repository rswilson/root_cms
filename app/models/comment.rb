class Comment < ActiveRecord::Base
	attr_accessible :post_id, :body, :name
	validates_presence_of :body, :post_id
	belongs_to :post
	
	HUMANIZED_ATTRIBUTES = {
		:body => "Message"
	}
	
	def self.human_attribute_name(attr, options = {})
		HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end
end
