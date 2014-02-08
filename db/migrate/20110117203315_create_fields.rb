class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.string :name
      t.string :label
      t.string :type
      t.integer :position
      t.string :default_value
      t.integer :number_of_selections
      t.boolean :required
      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
