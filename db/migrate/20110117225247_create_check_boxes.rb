class CreateCheckBoxes < ActiveRecord::Migration
  def self.up
    create_table :check_boxes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :check_boxes
  end
end
