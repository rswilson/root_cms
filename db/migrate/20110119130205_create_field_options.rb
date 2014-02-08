class CreateFieldOptions < ActiveRecord::Migration
  def self.up
    create_table :field_options do |t|
      t.string :value
      t.integer :field_id
      t.timestamps
    end
  end

  def self.down
    drop_table :field_options
  end
end
