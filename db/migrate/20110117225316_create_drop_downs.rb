class CreateDropDowns < ActiveRecord::Migration
  def self.up
    create_table :drop_downs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :drop_downs
  end
end
