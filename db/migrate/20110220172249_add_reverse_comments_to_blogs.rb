class AddReverseCommentsToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :reverse_comments, :boolean
  end

  def self.down
    remove_column :blogs, :reverse_comments
  end
end
