class Post < ActiveRecord::Base
  attr_accessible :title, :body, :blog_id
	validates_presence_of :title, :body, :blog_id
	belongs_to :blog
	has_many :comments, :dependent => :destroy
	paginates_per 1
	
	def approved_comments
		if self.blog.approve_comments
			self.comments.where("approved = ?", true);
		else
			self.comments
		end
	end
	
	def comments_awaiting_approval
		if self.blog.approve_comments
			self.comments.where("approved != ? OR approved is null", true);
		else
			return Array.new()
		end
	end
end
