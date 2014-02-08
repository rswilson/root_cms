class AddReversePostsToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :reverse_posts, :boolean
  end

  def self.down
    remove_column :blogs, :reverse_posts
  end
end
