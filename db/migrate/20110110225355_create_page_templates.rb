class CreatePageTemplates < ActiveRecord::Migration
  def self.up
    create_table :page_templates do |t|
      t.string :name
      t.text :content
      t.text :header_content

      t.timestamps
    end
  end

  def self.down
    drop_table :page_templates
  end
end
