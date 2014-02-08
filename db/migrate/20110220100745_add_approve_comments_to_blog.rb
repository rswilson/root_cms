class AddApproveCommentsToBlog < ActiveRecord::Migration
  def self.up
	add_column :blogs, :approve_comments, :boolean
  end

  def self.down
	remove_column :blogs, :approve_comments
  end
end
