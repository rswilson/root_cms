class AddPageIdToPageVersion < ActiveRecord::Migration
  def self.up
    add_column :page_versions, :page_id, :integer
  end

  def self.down
    remove_column :page_versions, :page_id
  end
end
