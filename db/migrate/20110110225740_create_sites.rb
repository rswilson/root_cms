class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :contact_address
      t.integer :start_page_id
      t.integer :default_template_id
      t.string :global_title

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
