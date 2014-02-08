class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :page_template_id
      t.string :name
      t.string :title
      t.text :content
      t.string :filename
      t.integer :folder_id
      t.integer :site_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
