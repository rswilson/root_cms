class CreateRadioGroups < ActiveRecord::Migration
  def self.up
    create_table :radio_groups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :radio_groups
  end
end
