class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :name
      t.integer :parent_id
      t.integer :menu_id
      t.integer :link_id
      t.integer :position
      t.integer :folder_id
      t.string :override_link

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_items
  end
end
