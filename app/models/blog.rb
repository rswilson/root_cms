class Blog < ActiveRecord::Base
  attr_accessible :name, :page_template_id, :approve_comments, :reverse_comments, :reverse_posts, :truncate_posts
	belongs_to :page_template
	has_many :posts, :dependent => :destroy
	validates_presence_of :name, :page_template
end
