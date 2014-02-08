class AddVersionToPageVersion < ActiveRecord::Migration
  def self.up
    add_column :page_versions, :version, :integer
  end

  def self.down
    remove_column :page_versions, :version
  end
end
