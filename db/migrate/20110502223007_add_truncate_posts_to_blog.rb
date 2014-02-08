class AddTruncatePostsToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :truncate_posts, :boolean
  end

  def self.down
    remove_column :blogs, :truncate_posts
  end
end
